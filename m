Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA502572
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Sep 2024 04:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726548881; cv=fail; b=D1MiqSB9f3z5kEHNHD5VO5RDlNfPz4S46I3ueSJ7rgOzmYkNTRq41z1+8xd2NvPPhbTrTl3UHEWxVSeZUUZjYtyNkI4Wh3wdrx5FXFDUplfnl2ZhlqFA0M97egUZo04EsI4Wk4H2olgyyDdde8xnUNPCvMfrz2oTo1FQ9/m5wnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726548881; c=relaxed/simple;
	bh=FlXQQ5ea67lMiLxMG/dN+yYSvFLQUKGfyavuF+McDNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UMcPjUWGN7qpobOkfyVJUs1P0Mv+sBUtIlVgEDkSm4WJqjsEA7FZ96W3cJKdC6hfC2vJH6MzJOooVIfSidRp3LzZg5PsevOjoP6qUZt/bC1ZbffaLX6nWsDpflbjDogSzolCflnfFJXsuvZYyoAMzbw5wFrA1+ejz+xl88bYCMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=IQT7FtcD; arc=fail smtp.client-ip=40.107.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="IQT7FtcD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABh2RpdYi2T8Cly9d7WFivT/IoKxzjX3Wf0ISF8ebMiSz2KodcH66LoDSn+P2BwVMY6+/yju/qkheCSqBJuzow4QKGmUipK3tARkBsWgVU5QhvjsLTsE1ebQyUF0t8DiChQw3FnCrz+K0VQRhGYaoIJvyTYBpMBhhZf4He9jIV6nJgEVXQoIiqLGfIHppAUNDxIUl8rsI7Jf0SP5tXarFfslQ8B6wqacTiYesqi1kIXu8rCqSJUUCJEzpdSqY1ACK/CJ+wYrxV4irZg8T7oq1dgKyveXH/160HY/j4w7IfO71dL657btAcrVck1NEDHP3nZ9MGyFWD/T/LYm83HrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGVs4ErKAOYiWAtv4873T1fglqPWHES1VdzYrvRFJCo=;
 b=ATfTuzJzPe5l1ocwPoTgTkDcME55ePUNX7kToh1z5T6G7n+tPGBFE5fOh4QuXria4TpDX3aHdc13hUcMQjDlQYPPoJST+UVt/9p9Via6Qo9D0DtkuXLI9wRyRhKW2I4eUvvd2erhARym2oztxXGsIHtkbwKsI+neHSju0BlcSXGjl0uXqP+RYkHhxmj9s004YYtqLd4vzTUSKluhF/7HgbM8EuHbhckUFxa7vOjLnAPejx6up1t7YvDlsbI1MOQqlfz8rkyND/kKQYQf6JG2cSLxta/VFPxqu40yyOMkLr/2kkwRVeKE1/5L29ufr7gITv7R9/HISpAGh828YMXgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGVs4ErKAOYiWAtv4873T1fglqPWHES1VdzYrvRFJCo=;
 b=IQT7FtcDKn5ub4Kd6JqPJsiIEIxpqzPkwdNfsM4YO8MQsH9ZDgH0UrH4WT/JSqaHsZjERMPiuzXfk78uyUghr2TzL6YQvRt3A3E3BY7t0HXtBxXHRabBEiNVgJK0fi0+l+w4G1fG+QHGWH+0ECtmEcFw6qIRYSQrhFfSQs0JkRhRkBloB1+jirBNnX+pS7G+otQs0V90D61Iz0BPOxlxOdtFrqgFbe52O692G9wneQ3FoZ4wuelaAP+Vix8XYtt9HQr/Neypy9ix620q9rkTonwNf5WyyoQ0YfGqsuouyInhW03KdEmS/zQvYpgJFjP+7kluVQ+/cexr43LppN09LA==
Received: from DU7P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::11)
 by VI1PR10MB3486.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 17 Sep
 2024 04:54:32 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::87) by DU7P194CA0020.outlook.office365.com
 (2603:10a6:10:553::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Tue, 17 Sep 2024 04:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 17 Sep 2024 04:54:31 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Sep
 2024 06:54:29 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 06:54:28 +0200
Message-ID: <33b744e5-6acc-404b-aaa1-91a734df1714@de.bosch.com>
Date: Tue, 17 Sep 2024 06:54:17 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: mutex: fix __mutex_init() usage in case of
 PREEMPT_RT
To: Miguel Ojeda <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Gary Guo <gary@garyguo.net>
References: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
 <20240916202831.136eb76b.gary@garyguo.net>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240916202831.136eb76b.gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9C:EE_|VI1PR10MB3486:EE_
X-MS-Office365-Filtering-Correlation-Id: 242bea04-b596-49d7-06af-08dcd6d4d1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2cwUWZlRkdmSjdqcWhMR1p6eksrRkJPM29MWERVd3psTmlweXUramlBRENz?=
 =?utf-8?B?QWswUktvTVpBWWNBV0txak1UMGJ6aFh3bWlZNUJIbHd4TGU1YTZoQnBvUllL?=
 =?utf-8?B?d2g4QlVPQWdvK21Za3d1UTVscUV3WlBYK1AyelF1eE1QRE9TbDJlNmJndjRt?=
 =?utf-8?B?WlNnaGdNUzRQOVJDRXNqYUhtNXpKYytXUTFhVFQxVGJxTnR1WDlVMmliVCtY?=
 =?utf-8?B?NHFmWVJWQ2pUUzdmOTJDVWFIWjQ1ZWVldWkzeXdoaGh1Z3VPbVhOOGkzYXNr?=
 =?utf-8?B?dEpnYmU4d013VnAxbWZZZDE0K29heGYvQ1RpMkxvMjk4UFhVYUM5d05vY3hE?=
 =?utf-8?B?V2ZZcFR3aDJWZmR6TzIycDVNcTkxNDJ6azY3N21VUXZEL0JUWFpDOG9SLzBk?=
 =?utf-8?B?ZGRYVlVVUGhYWVRFQm5zTngrWHFQcENjdHZ3ZGxKRkdnMEszK01EeXVoUlFt?=
 =?utf-8?B?TEdsOGhSVTNvZWoxRkQyTUo3NWxpdDZFSzFKcGpQUyswR0x0MllKMk9GaTNS?=
 =?utf-8?B?MitXeXBZUWJTNjJabEdMRko4R0p4UkVyUlNLcFNhNmdJYjlrVWhkWFRPcFZm?=
 =?utf-8?B?ekVWR3JOdUs5TUliMDg5M3JzQnZPUFRrVkhRWDZGdjVYKzBqOUlNVDlSVHl4?=
 =?utf-8?B?b0dvMTdrbU02Y0QzdlpWYzRXeU5jUURTemxVWURKQ2I1ZnVuUlpxc1c2WVlR?=
 =?utf-8?B?eG80V1FkSmdVVEQvY3NrbU1ZRXl5bTBWbEFGVzFDa0hOSmFQcmtueE84cGUr?=
 =?utf-8?B?dk5XQjV1RUtXKzlCSjdmU3pIRkFoTzdWZ3piNFZqK0cxc2p5M25HRTBLLzJm?=
 =?utf-8?B?UUErak1Xek91U1RFZHQvd0lGZ1FPeFZGdm12ZHJyWmpsQVlGdEpaa0Q1ZWZS?=
 =?utf-8?B?N0Jlek1wdE9XVVE4Yi9ML2ppcjZhcWlpa1FrOFJ4WG4xQnBUZUJvbjQ5QWJG?=
 =?utf-8?B?NEtmWTB6VG5TeWlTdG1EOHdPdUlGNjd1Z3hIbW45eDZOUFZ6bktvN1Axa2d6?=
 =?utf-8?B?QkxFUExWM2FFYUhXeHJEbVNndi84U1FXR3FreDI0bE5iaUhvOUxQOGc5SmlY?=
 =?utf-8?B?alZDTndSTHZJZm1EVjdxM3pCR2t6NkhacWoyWE1GSlJNeWtpRTFGdjBYU2I1?=
 =?utf-8?B?RlJGMXY2R296MS9RODRIS1RoUmZqOUZFTzBDaWpwZmhVYjByK29Od3JySlZY?=
 =?utf-8?B?V2lwRnpFanllWGw3N0ZJdEJicWlRN2gxQm85NjBwa1VlOU5WaVJPRXQ1OU9q?=
 =?utf-8?B?c3RxN2Z6WFgyN2VuN2NFdkNnKzYxQXFrYUlqc1NZN0hTVHM5UmlTbXVnRG1z?=
 =?utf-8?B?NmtPWDROREVSeGt3eWp0RGMvZkRMSDBEVmo4Y0hiMGNqSmhGK2N1aXBOVE0z?=
 =?utf-8?B?TW5zNnp0dDdFVlFwK3Z2U2RseW1PNkRFbWpMQndpMnBsVEFIUG96elpZOE05?=
 =?utf-8?B?QVdSOUtyNWVvVWlXeDlGOHRYY1ltUEtVM3FuR3U1NGUxakVtd0pQTEVwVXp4?=
 =?utf-8?B?aE1OdEQ0N0tmaVc4blhuaFBTNzdZUUU1UUo2WjJhbUY0RElXcDJScGYyaWh5?=
 =?utf-8?B?b012a1FWM2taSmVhVlZUMFIvNXJwdHhFcDNGSnNBSjFXbFdEd29CSXJWcFRa?=
 =?utf-8?B?cWhhSit2VDVZZGVaMGhEZjVIME82U1ZRWmFlYUluRnp0UUxUV1hZMHE1QVhN?=
 =?utf-8?B?WlhtcWRJVW1SSExJRitNNmsvbWJEdDdYNnBSUndrTVV1MnBBNjNMcGFhYm1L?=
 =?utf-8?B?TUJHS3dMMVBaZFN0dDhMajN3SENDdE5MUFFBclVzV2FGUDlkb3JYcDZSSXkr?=
 =?utf-8?B?ZjNHU0t1Rit6ZTJwV2U3VDg1ci9IVnpXZ3dOWnFXdE96Z21mZVZJYXVNZU5l?=
 =?utf-8?B?TlgwTC8vSzVZc1JCbm42ZW5ZZTlRSUF2OVVsaXNKMERXZzlmaUZoNFlTYjdU?=
 =?utf-8?Q?qoE2vt7lgNIJpQUzmjOwjfb5+DHX5JDJ?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:54:31.9657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 242bea04-b596-49d7-06af-08dcd6d4d1c6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3486

On 16.09.2024 21:28, Gary Guo wrote:
> On Mon, 16 Sep 2024 09:37:52 +0200
> Dirk Behme <dirk.behme@de.bosch.com> wrote:
> 
>> In case CONFIG_PREEMPT_RT is enabled __mutex_init() becomes a macro
>> instead of an extern function (simplified from
>> include/linux/mutex.h):
>>
>> extern void __mutex_init(struct mutex *lock, const char *name,
>> 			 struct lock_class_key *key);
>> do {							\
>> 	rt_mutex_base_init(&(mutex)->rtmutex);		\
>> 	__mutex_rt_init((mutex), name, key);		\
>> } while (0)


I just noticed that git commit fooled me and of course removed the 
C-macro lines beginning with '#' as git interprets that as comments :(

The above simplified example from mutex.h in the commit message should 
be correctly:

-- cut --
  #ifndef CONFIG_PREEMPT_RT
  extern void __mutex_init(struct mutex *lock, const char *name,
			 struct lock_class_key *key);
  #else
  #define __mutex_init(mutex, name, key)			\
  do {							\
	rt_mutex_base_init(&(mutex)->rtmutex);		\
	__mutex_rt_init((mutex), name, key);		\
  } while (0)
  #endif
-- cut --

Please let me know if you want a v2 with corrected commit message or if 
that could be corrected while applying :)

Best regards

Dirk

>> The macro isn't resolved by bindgen, then. What results in a build
>> error:
>>
>> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
>>       --> rust/kernel/sync/lock/mutex.rs:104:28
>>        |
>> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
>>        |                              ^^^^^^^^^^^^ help: a function with a similar name exists: `__mutex_rt_init`
>>        |
>>       ::: rust/bindings/bindings_generated.rs:23722:5
>>        |
>> 23722 | /     pub fn __mutex_rt_init(
>> 23723 | |         lock: *mut mutex,
>> 23724 | |         name: *const core::ffi::c_char,
>> 23725 | |         key: *mut lock_class_key,
>> 23726 | |     );
>>        | |_____- similarly named function `__mutex_rt_init` defined here
>>
>> Fix this by adding a helper.
>>
>> As explained by Gary Guo in [1] no #ifdef CONFIG_PREEMPT_RT
>> is needed here as rust/bindings/lib.rs prefers externed function to
>> helpers if an externed function exists.
>>
>> Reported-by: Conor Dooley <conor@kernel.org>
>> Link: https://lore.kernel.org/rust-for-linux/20240913-shack-estate-b376a65921b1@spud/
>> Link: https://lore.kernel.org/rust-for-linux/20240915123626.1a170103.gary@garyguo.net/ [1]
>> Fixes: 6d20d629c6d8 ("rust: lock: introduce `Mutex`")
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> 
> Hi Dirk,
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> Thanks for sending the patch.
> 
> Best,
> Gary
> 
>> ---
>>
>> This is against rust-next to use the new helpers layout.
>> Due to the helpers layout change I'm thinking it is not worth
>> the effort to backport to older kernel versions, so I intentionally
>> did not include -stable.
>>
>>   rust/helpers/mutex.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
>> index 200db7e6279f0..a17ca8cdb50ca 100644
>> --- a/rust/helpers/mutex.c
>> +++ b/rust/helpers/mutex.c
>> @@ -7,3 +7,9 @@ void rust_helper_mutex_lock(struct mutex *lock)
>>   {
>>   	mutex_lock(lock);
>>   }
>> +
>> +void rust_helper___mutex_init(struct mutex *mutex, const char *name,
>> +			      struct lock_class_key *key)
>> +{
>> +	__mutex_init(mutex, name, key);
>> +}
> 
> 

-- 
======================================================================
Dirk Behme                      Robert Bosch Car Multimedia GmbH
                                 CM/ESO2
Phone: +49 5121 49-3274         Dirk Behme
Fax:   +49 711 811 5053274      PO Box 77 77 77
mailto:dirk.behme@de.bosch.com  D-31132 Hildesheim - Germany

Bosch Group, Car Multimedia (CM)
              Engineering SW Operating Systems 2 (ESO2)

Robert Bosch Car Multimedia GmbH - Ein Unternehmen der Bosch Gruppe
Sitz: Hildesheim
Registergericht: Amtsgericht Hildesheim HRB 201334
Aufsichtsratsvorsitzender: Dr. Dirk Hoheisel
Geschäftsführung: Dr. Steffen Berns;
                   Dr. Sven Ost, Jörg Pollak, Dr. Walter Schirm
======================================================================

