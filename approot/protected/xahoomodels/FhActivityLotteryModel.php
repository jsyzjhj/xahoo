<?php
class FhActivityLotteryModel extends FhActivityLotteryModelBase
{
	const STATUS_HIT_NONE       = 1;    // 未中奖
    const STATUS_HIT_YES        = 2;    // 已中奖
    const STATUS_DISPATCHED     = 3;    // 已派奖
    
        /**
         * @return array validation rules for model attributes.
         */
        public function rules() {
                //新增的在这里面加，如果修改 需要修改父类中的Rules
                $curRules = array(
                );
                return array_merge(parent::rules(), $curRules);
        }

        /**
         * @return array relational rules.
         */
        public function relations() {
                $curRelations = array(
                );
                return array_merge(parent::relations(), $curRelations);
        }

        /**
         * custom defined scope
         * @param  integer $pageNo   页码
         * @param  integer $pageSize 每页大小
         * @return object
         */
        public function pagination($pageNo = 1, $pageSize = 20) {

            $offset = ($pageNo > 1) ? ($pageNo - 1) * $pageSize : 0;
            $limit = ($pageSize > 0) ? $pageSize : 20;

            $this->getDbCriteria()->mergeWith(array('limit' => $limit, 'offset' => $offset));

            return $this;
        }

        /**
         * custom defined scope
         * @param  integer $limit 数量
         * @return object
         */
        public function recently($limit = 5) {

            $this->getDbCriteria()->mergeWith(array('order' => 't.last_modified DESC', 'limit' => $limit));

            return $this;
        }

        /**
         * custom defined scope
         * @param  string $order 排序条件
         * @return object
         */
        public function orderBy($order = 't.last_modified DESC') {

            if (!empty($order)) {
                $this->getDbCriteria()->mergeWith(array('order' => $order));
            }

            return $this;
        }

        /**
         * 与Smarrty中的文本提示相对应，可以修改成中文提示
         * @return array customized attribute labels (name=>label)
         */
        public function attributeLabels() {
                $curLables = array(
                );
                return array_merge(parent::attributeLabels(), $curLables);
        }
        public function mySearch()
        {
               // @todo Please modify the following code to remove attributes that should not be searched.
                $criteria = $this->getBaseCDbCriteria();
                //为$criteria新增设置
                $count = $this->count($criteria);
                $pager = new CPagination($count);
                $pager->pageSize = !empty(Yii::app()->params['pageSize'])?Yii::app()->params['pageSize']:10;
                $pager->pageVar = 'page'; //修改分页参数，默认为page
                $pager->params = array('type' => 'msg'); //分页中添加其他参数
                $pager->applyLimit($criteria);
                $list = $this->findAll($criteria);
                $pages = array(
                    'curPage' => $pager->currentPage+1,
                    'totalPage' => ceil($pager->itemCount/$pager->pageSize),
                    'pageSize' => $pager->pageSize,
                    'totalCount'=>$pager->itemCount,
                    'url'=>preg_replace("/&page=\d*[^&]/", "", Yii::app()->request->getUrl())."&page=",
                );
                return array('pages' => $pages, 'list' => $list);
        }
        public function mySearch2($sql)
        {
               // @todo Please modify the following code to remove attributes that should not be searched.
                $criteria = $this->getBaseCDbCriteria();
                //为$criteria新增设置
                $ssql = 't.id > 0'.$sql;
                $criteria = new CDbcriteria();
                $criteria->order='t.create_time DESC';
                $criteria->addCondition($ssql);
                $count = $this->count($criteria);
                $pager = new CPagination($count);
                $pager->pageSize = !empty(Yii::app()->params['pageSize'])?Yii::app()->params['pageSize']:10;
                $pager->pageVar = 'page'; //修改分页参数，默认为page
                $pager->params = array('type' => 'msg'); //分页中添加其他参数
                $pager->applyLimit($criteria);
                $list = $this->findAll($criteria);
                $pages = array(
                    'curPage' => $pager->currentPage+1,
                    'totalPage' => ceil($pager->itemCount/$pager->pageSize),
                    'pageSize' => $pager->pageSize,
                    'totalCount'=>$pager->itemCount,
                    'url'=>preg_replace("/&page=\d*[^&]/", "", Yii::app()->request->getUrl())."&page=",
                );
                return array('pages' => $pages, 'list' => $list);
        }
        /**
         * Returns the static model of the specified AR class.
         * Please note that you should have this exact method in all your CActiveRecord descendants!
         * @param string $className active record class name.
         * @return FhActivityLotteryModel the static model class
         */
        public static function model($className=__CLASS__)
        {
                return parent::model($className);
        }
        static public function listArticle($startDay, $endDay, $phone, $status, $order, $page=1, $pageSize=10, $condition=[]) {
            $limitPos = ($page-1) * $pageSize;
            $whereClouse = ['1'];
            $whereParams = [];

            if ($startDay) {
                $whereClouse []= 'create_time>=:start_day';
                $whereParams [':start_day']     = $startDay;
            }
            if ($endDay) {
                $whereClouse []= 'create_time<=:end_day';
                $whereParams [':end_day']       = $endDay;
            }
            if($phone){                
                $whereClouse []= "member_mobile like :phone";
                $whereParams [':phone']       = "%".$phone."%";
            }
            if($status){                
                $whereClouse []= 'status=:status';
                $whereParams [':status']        = $status;
            }
            //var_dump($whereClouse);die;
            $list = Yii::app()->db->createCommand()
                ->select('member_mobile, member_name, prize, points, status, create_time')
                ->from('fh_activity_lottery_log')
                ->where(implode(' and ', $whereClouse), $whereParams)
                //->group('article_id')
                ->order('create_time DESC')
                ->limit($pageSize, $limitPos) // 参数位置 与sql中的limit刚好相反
                ->queryAll();


            $count = Yii::app()->db->createCommand()
                ->select('count(DISTINCT id) cnt')
                ->from('fh_activity_lottery_log')
                ->where(implode(' and ', $whereClouse), $whereParams)
                ->queryAll();

            $count = $count[0]['cnt'];
            $pages = array(
                'curPage' => $page,
                'totalPage' => ceil($count/$pageSize),
                'pageSize' => $pageSize,
                'totalCount'=>$count,
                'url'=>preg_replace("/&page=\d*[^&]/", "", Yii::app()->request->getUrl())."&page=",
            );
            return array('pages' => $pages, 'list' => $list);
            //return $list;
        }
}