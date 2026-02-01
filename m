Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022105.outbound.protection.outlook.com [52.101.96.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7080126C02;
	Sun,  1 Feb 2026 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769975512; cv=fail; b=t2WdJ+RcPg2lll0up/NTshCJ89OIqkQxAyOJbqycNvZX4hyeprHQKOVnOtWbZZ7Kj5pdOKMMi99WQ6QEGaPuwQWTCLrsadsEuCtn8vZp8J7Q8G3+D2eSv5cBIqqfGtf+Ap035CqJlnE2Vbdl0OC5FUy4Nl49zoBoaKlET4Pg2Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769975512; c=relaxed/simple;
	bh=vOsLpCMM2f751v7hzCIAINNUisfkrl5xY8o0hDRTQEk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=I+uKiVoetMQCqqIJbGekYvzeuWWkhEFJKsT7GLTSi9HJj68Y7TDjrcAjavH+CjKbAmIW2mAZ72Htur0G/aeSf31ryP74o1t3T5YESgxGKX1U/F8Hr6Cwz3gfRFib8Ga3eKwCt3kHZMe2/CCEj41h6NHcC9CF4alhIk+39AHsuQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uliH09J2; arc=fail smtp.client-ip=52.101.96.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uliH09J2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUewJGjn4DXoEIvfotWvbis1Wl+8OpS5ql9OT14qqPvj+DEploEmJ1FOAE5AMtthvPf56PrFs2F13+uePUz91q93tRiaxMtrX3xOPmFD9DU3srvAe8OOwIpK/AmdwPWqN9MonktIrmlBxMjjkvi3o4ty1OLSxNvoTr5VlNd0nxfFR6gdjNKyoafq126aDlzeNO+zI0WUpwFsm/hsNt0zixlCB43ceggCJAZuPgPGzi275vL3ZbIn/pLaxZLDL0jdMtNp7j9vqzgR8YUai9YQICu6bHph0b1cH5/E81/8iRcRAjgICGUxKMSJi84JRjusq48d9nX/Ii+VKPPEyI9wKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtnUl+mwIYr0rqaHysjsSAjdTqcAqhDU+tUKrTbBNY8=;
 b=oXc3hyZ+Rw2LFDgJuRxzwJLZvHhsxPJsJja7lSpWOBnLU2hF0RRxgW8t8RboLHar+dNRYXaIjfKxFaKXDhP3KVanMrNtApPLRd9/J6Ta6elU80Cyat3peV9w8eaLoORIuywsJxsOS2Jp8LrMVoGybY8kcdgsgDQm60EVEY7ITEonBzLtmF+gbmbEdkhaRa5Dw6Y/5jbuGIN+pyfzziI4eFxBMrE8wlJh+RH5Ni7DKuqCC8Zfl4JXRSS248i986uy6b1OHWF5zznR4xxZdOgg290K/x/DEDgbtBPx16TEt5ItuCTRPZthMeXQtJa1IaNdNG/eQjR5qMXuG++wgHkZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtnUl+mwIYr0rqaHysjsSAjdTqcAqhDU+tUKrTbBNY8=;
 b=uliH09J2v4nU00vv4l7gampWXtiPJqX20Wer2frHfPN1WlGXiwcqfXom4rfmfLmfxkkPKSoFFGCZSu52Hw+Uw3jZ2PxYiZIbm+SewqSlaSG1cO5WxcL9yH8AYnCYH8yqYuFg0xKJ9/QGbTgoPiyk/N6c0gWRXSfn4oq0OeFcW70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8710.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:489::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Sun, 1 Feb
 2026 19:51:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Sun, 1 Feb 2026
 19:51:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 19:51:47 +0000
Message-Id: <DG3VYAW3TXEO.1YG8N99YWCDR6@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts: checkpatch: warn on Rust panicking methods
From: "Gary Guo" <gary@garyguo.net>
To: "Jason Hall" <jason.kei.hall@gmail.com>, <apw@canonical.com>,
 <joe@perches.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260201155718.1623802-1-jason.kei.hall@gmail.com>
In-Reply-To: <20260201155718.1623802-1-jason.kei.hall@gmail.com>
X-ClientProxiedBy: LO4P123CA0280.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 449522e8-eb07-4757-868b-08de61cb55b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzBYb09ISlZFb3hCMng3YllBcVN3dWwvVmlXVUhQcHlZZVRIYWRjKzFEYU1p?=
 =?utf-8?B?M2pYeHEreHJOcUtoMW1yVmk3RC9yYzRaS05DdEE2bFAraTE1bjRGUVlzSFBu?=
 =?utf-8?B?UzVyOEdEM045MVgwaytNWC9JOXIwTVNMZ05tb1RoejlaQ2RLdHBNMEswT1RJ?=
 =?utf-8?B?WXFlWEFUUlM1TmQ1YkRLYmpuMW8xYWRSOHpmUXpPblEycE1NRjdzUDdDR0da?=
 =?utf-8?B?K2NYeUJqV2J1TDM0Vk9jb0xQUTY2dEplbnRFYzZIZE5XOFZrMTlLcTgyZXhG?=
 =?utf-8?B?bUphUklsWjBSZ0dmVGprTFJjZUg2Mkl1bU5HRHdMRDIyRElMaEx5bFdIWERp?=
 =?utf-8?B?bEFPRlZSZWNUWkl4MVVMOURhRVR3WXZnMXpUUWo0TitQSVp0ZWtkZTdncU1i?=
 =?utf-8?B?YnpmQTVzSmlWc0RaamFyZWtqMGNMVWw3T2x6aW9RWkI1T1R0OXlQczdoVk1a?=
 =?utf-8?B?VEh1WDFoT010YlV3V2JPY0lpTGVMTmxPWTFHSmpac1FQYUFMdm01MElEYWRo?=
 =?utf-8?B?TkdqL1BHTXg5K3FrV2xnYlF5VSs5S0NSZTB1S2kwS3NTazZxY3NpNEIzYmRv?=
 =?utf-8?B?NlVjSW8zek10aGhpV0NPeTNzYzcyN3hXQ3BVbUJ3Z0FNR0VoaGxRR3ZlQ1NB?=
 =?utf-8?B?aGZYUlRXZ2xUa1hmTGRVQXkyUDJxcEROOU0zeTFoTDBZMGpDLzJISGJMemJm?=
 =?utf-8?B?WmY5L3M2MEVzMGMreGdWRjJvZFFsL3I2R2F3OW5UNzV5ZFpIeUdndVpiWldE?=
 =?utf-8?B?OWo3S2xSUkZBbnRRYzh6SnhRR1d5Y3pNdG5DOUloNzZTcXJBSVdvRlg1QjJB?=
 =?utf-8?B?dEl1RWxzZzRRNTFScVExeFVQd2o3ODFRNGtpOER2Sm8vRDJ2RWlseHZ3T3dW?=
 =?utf-8?B?Q2RYb3ExcUw0ZkhlY0Y5RXlIODA3UklGZ2dFSThVeUJIdmNjd3RrTEJOcE96?=
 =?utf-8?B?aUJQbmpkT1FuOUJZMGJoZ0RYRVVEL3dSSWJBVlpkbFEyc3lYNkphRFh5dDhM?=
 =?utf-8?B?ZXBhUVJWTzdNMEl1NUVCdkRIdkNWSjhGckhtcmRPK1dzbGxSUnZEN2VZcm1p?=
 =?utf-8?B?eFoyalVzMEJtbmxBdmIvWVdiSytvMHhJMnZpT2ZPRFkzVUF2QkttbzY4bzBT?=
 =?utf-8?B?KzNNM0l6cXMzVTBVSkJaaVdIM1djZWxwbnBzS3BGeVBZZGhVeDZZSzNUQjV3?=
 =?utf-8?B?RlM5N2NTN2ZXZmxmMTdMUUovMngzWlJyUmNmdk02bGV3akhTK2JXeUlpUFZB?=
 =?utf-8?B?MXpja2pHczU4RllzMU1SNFZmbmxaS2xORHlicTRQeit1c1FYRTAzSE5CSHlp?=
 =?utf-8?B?Z1dxSWowTzBtcDBEeTIvRGlkS3hJNUdnNWNROVFoYmhHSXJWOHNjdUgwdE03?=
 =?utf-8?B?cTcreWU0UHR5QWEvZDlPS0kvd2lqeC85d3VDVTdGRThKRGZYMmIwYithZDV3?=
 =?utf-8?B?V3p0bzVjdUw3ODcxWXE1cmNEQTlHRTNTa1g5d0l6YnptN1FiYUxkbGdPeUVa?=
 =?utf-8?B?OTljOHA5bEhsUkozTDZWeTRuZkkyYXJvUHFxWEVsQkxkN2FaU3huMnJVZU9V?=
 =?utf-8?B?Y0J1M2l2bWJjNHZQMk1POTRXTVF2TDVNTHJUcytKbDhvSTR1Znl6a2JTV2Vq?=
 =?utf-8?B?cjh0TFpnYkRxSldZMUYxd21qaERKYjZiREVlVWtwdGViTnlYaEl4MDZua3Fk?=
 =?utf-8?B?dWJqQlF6ejUraUErSVM4TFgxZTdhM0JFSE1XV3hUNExtcjErTnpHdms0SmlS?=
 =?utf-8?B?d3A3V1BmWTZrZGhraHNxYWNwaCtJeFlJeEx2OXBzdXorMEFjT1VxSldXd083?=
 =?utf-8?B?bGRrb1g1TVd2dUhPWVZueHR6dUlEZkZ2UTlZS1RoZnFrbTBDS1hlSjdndUFY?=
 =?utf-8?B?RkpSSGQzZTgrQWhmZDYvVGk0Q21YM1VWU1pzQy9aQ3BsS2xGQklEaHpkNWxu?=
 =?utf-8?B?UXB3VzhNQUI4RnVmam1TRlhLZU42SXIzd083MGpvVEtCbFprZUYxQnAyY3Fa?=
 =?utf-8?B?U29Icm1ydTI0aDNtOVZpaVZQOGFpRVhieFpwSVVEK0VwUFlLS2orZEp0ZU5G?=
 =?utf-8?B?cEhlV09TZkFnUG1ESWhnemRwYkJ5TWM3cVlJRG9oditrRXRjVG1UZkFzRVRi?=
 =?utf-8?Q?4iao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWI3dGsrbGZxVVVEekZFMzNxQU81akN4U05HNnFkM1V0OFl2RlFHUE1KUTFZ?=
 =?utf-8?B?MGJUZXVtSlM5VXB6NGZCYTRkMlVRVFJXTXEwcVZqQVZYbTJmS2czMGpVYlg4?=
 =?utf-8?B?U2VjSWJFMUNMUUNmN3JRQ041V1FoUU5EUldDejNVVkFZeXZhRXdnR1Bnb252?=
 =?utf-8?B?aGVwTUpHUWVrVGdta0NaQjhlbWxpcCtCaFlhd0RHUVk0cWVYYWthVWxMRzlV?=
 =?utf-8?B?NWQzbFYrcmVTR3JlN2FKdmNoQkVxNTloZHBaKytOakRWcG12dU4yVVdoZGg5?=
 =?utf-8?B?YUdoOWRNeU93VzdGTHZVaEM2MjVzQVJhdDBpaVZQMnkzRm0rWVlybHF1eWZG?=
 =?utf-8?B?eENScVVxTWJIMUsrNTA3Ukp2SWs4RlQ1NkhFeWlDTmxtZnlpSDlGVUhKL2hV?=
 =?utf-8?B?cFRYV1A5cGM5T1ZuUXl0blNKcCtnbUUyMGVHYWdqZjk1UmI0Z1MrRDRLeXJN?=
 =?utf-8?B?RUhkY1BkRnF3VmxlODF4MU1BSkNnSytaYWtZdGE0VUVFbUVYMEUzbHRsV3lL?=
 =?utf-8?B?QjllMnp3eklQeC9NUE5hWExYYitpVVBrUnhtR2tqTGh4cFZieHpWaHppNzdP?=
 =?utf-8?B?ZGg1cXE3aW5lSjl5c29DcXNQcHducTNtZGtCWWJWMDYrOE9jVUc3THpsTHhi?=
 =?utf-8?B?Wm0zSGlMMTVRT21hL0JEeXU1dUJKSVk2TjNKUVVZcFlSeGRCUGxoWEhhRGJP?=
 =?utf-8?B?NG05Y0dKZzc1Y0RTWERVdDlOZVMxajlPV0pPcmhhcG5qeVIwTENnZThWVmpi?=
 =?utf-8?B?QjcwWlNXTk5zK3FpQnh6aWRxWXNZMUJYV0ZvSEthazhjY3dEMEYrbEJqRUtw?=
 =?utf-8?B?cWNkbkNaS1dpZnRTOHRFSlB1cFpGRGdDbGpyTC81OVdvQkxhLzk0blY3VC82?=
 =?utf-8?B?eDdweGtEaWJjN1NleDNJeGtFS1gyTGNkNzN3cU9CK050N3NwZVhGZkkzQjZN?=
 =?utf-8?B?cGpTcUhZYmh6bk1PTXBXbFZhQU9wSkM4TFM2U2dVNzZVRVVjUjJyVjRFVTNz?=
 =?utf-8?B?aW5TQ0NDeFJRQkZLbW1CWmZtdGpZQlJFazdBWUpmRkVlS1hubWdCUDhvSHVH?=
 =?utf-8?B?TER5NHJzcXVaM29DVjhEam13Vm1wZzgxT0NRZ2E1THkyVlBOVk1UQldiU2xq?=
 =?utf-8?B?ZjZrREZSbnBjYXFBalRlQStLNmxuZW53MWY5V25TYVByekwxOHJuZ1lvbDF0?=
 =?utf-8?B?Wmx4ZVNMYUpxcEpCWTdRMllFbVVqZFVXc0N2REtaUG1PTVdwOVZOZzRydGtu?=
 =?utf-8?B?K0FpaWtxMFZKdDNzckYram5NRWtLN2x2MHQ0Mmh4Q2I5b0txMGJIUFkycGNk?=
 =?utf-8?B?WjZoVU5vaTIyRklyaTFMaU5PNENSWmlvYmNOZ3Q1RjU4ZVZ3K3pha3UyNTln?=
 =?utf-8?B?bUdnYjByMk1kNG5jWG5jWCtxVlRXUlN3OFRFK09SeXZGdHIvb2hjRGhRRnpl?=
 =?utf-8?B?NVlDdHk5d0dCUytaa2JJMW52SFVpa1hLK085VjVPR1BMcmt4U0JBY1dpYUs5?=
 =?utf-8?B?dW0wNm5tY25ROE9IY0VuWW1CSm0rNzZiczVWUlE4VmpvaGhNNkJaZituU0VF?=
 =?utf-8?B?YSs3V244UmlXUnd1T2Q2Y29CcDNUUUx6R28xUmxnd3BZNXdCTXJNRHFoLytZ?=
 =?utf-8?B?RXBxemxJOUVEb1BuUlNhYmVWRDNWQzExeWRQZGVSd015VURRY3dKRHpaUlpP?=
 =?utf-8?B?N091bTgwaFVoTCtmeTV0TkdZUWVJeE00ZnVDNFNwM2lVcGxZQ3ZvbGlzUlE1?=
 =?utf-8?B?eTJ6c1pWT3FodFFzeG0wK3JUWFA5cVM2NkZPRzhGMGIycU1QVWJJYmNvMFZH?=
 =?utf-8?B?TURWaktRcmhMOW9YV3FES3MrSGhXZ2w2OXVHUGRwMlFsYTV0MXBnZUxDWGZN?=
 =?utf-8?B?VlZ1bm1pY0g3WlJCSENTUzQrN2dYTmg5M1ZWeFUrbkVIbjJGQ0NxV1lsWEZ4?=
 =?utf-8?B?QVJTMFJ3T2NiY2tHbVJPVWRXR0JmQnkzc3BQUkpDYjNzYXh6VXNqalVFUlNW?=
 =?utf-8?B?cld6Wm4wZzhHSUZ5eFBvdU1ndEhmYzhGVDJRK0Z1U0V5QkhEMy9EZWd5VjF3?=
 =?utf-8?B?ZUxGU1lOMjA4OG04VGpmVEtjbUxLNEtyOStPZUVIcFRVem5VUXNjb2w0WnZS?=
 =?utf-8?B?MG96cTlURnNuVEVaUUU3UFN3MTBhczFWWVlsTmZEejRFSG13N21lcGFEd3Z1?=
 =?utf-8?B?dm1CZGcwWGFrZFVseVE3d1hKc2FuK1Y3Vnc4U0JsN3g4LzRWejJvYkdvWjF3?=
 =?utf-8?B?bUUyR2hCcFNzZ3FDVllYT1VwaXljOW1PWEZXR0FDYzVUdWorQ0EzTjBMWlhE?=
 =?utf-8?B?ZWkvUUo4M01JYWZtWEg1TUtUR1pQTHNsWFVFUEQ4Z0NQK0JuV2pvdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 449522e8-eb07-4757-868b-08de61cb55b0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 19:51:47.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dExrOaEbfavYm8m/SaD/+XWBa1WCtbeQBIv+5Rt3BplrlQgV5PHwYuldnPozbWWZCmmuR0orFom+stenrPVBKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8710

On Sun Feb 1, 2026 at 3:57 PM GMT, Jason Hall wrote:
> Added regex check in checkpatch.pl for common Rust panicking methods
> like unwrap() and expect().
>
> Allowed an exception if the line contains a '// PANIC:' comment.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
> ---
>  scripts/checkpatch.pl | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c0250244cf7a..fa9f55031129 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3834,6 +3834,17 @@ sub process {
>  # check we are in a valid source file if not then ignore this hunk
>  		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
> =20
> +# check for Rust unwrap/expect
> +		if ($realfile =3D~ /\.rs$/ && $line =3D~ /^\+/) {
> +			if ($line =3D~ /\b(unwrap|expect)\s*\(/ &&
> +				$rawline !~ /\/\/\s*PANIC/ &&
> +				$line !~ /^\+\s*\/\// &&
> +				$line !~ /^\+\s*assert/) {
> +				WARN("RUST_UNWRAP",
> +					"Avoid unwrap() or expect() in Rust code; use proper error handling=
 (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);

I don't think `expect()` should need be warned here. There's already
justification being given.

Best,
Gary


> +			}
> +		}
> +
>  # check for using SPDX-License-Identifier on the wrong line number
>  		if ($realline !=3D $checklicenseline &&
>  		    $rawline =3D~ /\bSPDX-License-Identifier:/ &&

