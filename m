Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C04A2633
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Sep 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358866; cv=fail; b=cxMEA1FM8pMyzSmS1NugQbgaFcOvEX5OOSH50I3WHRUZGszm8MLGY0n1d7N2SezkzADlFjcEtITl1eIaGT1NrH52SWWei+6xN7P+FfdSxxp/s2/TFBpH0Vq7ok91nOnHuqJmz7Dp1eP89YyARZci34GsKdzn+GxDchJEHUiT9uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358866; c=relaxed/simple;
	bh=d6vDllba0PCnZrYTJdGD9CswhXOSkgjKvqcKcKIhGDU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RA52pF6YJ0Y5CjdxbPQSDQLZasCdqflbjJylobxJZ7drKffmtNBqFmj+rQUUonH8Tv25t9Y9iEPGglNMYQ7LsYP1FGZmXgh/DT2J8Q5RZ6l4vITOSML9cEwefIA5BGAJW6f2JGmgoL/mQ3rdcWr6oJgD3sScjwL0cWBsZdOTqBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KcpsoHUr; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KcpsoHUr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubnZ8VuGoUV+t5CzQVEHLCPIxwUdGRGCUX7ogoxaRQqBoZMLKX/rywx92Yx6S+SUFlak6xWY5FO5BvrfmHiHJMwilBy89P/esjIA9aDCHOA60f1roV0Nw8k1VXRP8Dfz9hVC40u4wxmHkTxLKCb/cGslMc0I1O8qUw9HKG3Rp9hERn/dh+Xk8MLrbhht5hcZXCgR8uoa1hLlah7NDryUBbvtpeekNkWI9Wyxg5K7P7xBW72tVtKruAZvg7SEpYFxBLOFk5QHTVLVUyq8YZgWD8k5zKPLd+hFjxl/at/zsWmf+tN2mjpbBNnD5DTFOBjrgdPPckOfm+mAoMp7dUljAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6vDllba0PCnZrYTJdGD9CswhXOSkgjKvqcKcKIhGDU=;
 b=TPUgGXVJ82KbQGc2XvRG17q5NPgT8Y1IG3/vI9QYdvZQvTOsVlHhqJP0de6+KtJ01Lj/Z+dcOsc5OSxOqdS3Z2Zz9kW/XjJD2rc2tDDswGl9UcsLx3VIYZ/oYCsfbouSQ5Gg94zY4xVCDyT6wTlOivSlPS9eS1bNALefxnj9VNfqoLqC7dX7o81dwh4EHBmhks17xZXdKCk8XzRd9IFz6PAWqV6Afb6gG+tHYG93BiXX4EhjceUt/TI27DSuWW1042lwExTDeerKU/rGvZkGvY6KRIFEBrC5R+c3Q+5ydl0njDSmMKdNawpH8Y7VZ9ojFpN89Y+tu3qRlxd5vGQ+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6vDllba0PCnZrYTJdGD9CswhXOSkgjKvqcKcKIhGDU=;
 b=KcpsoHUr+eiVZjBA9W4v9e6Big3nGELozaEL4vzD0f8/OW25vY1LaPcnv3rzz2sEa2MAnaWyCxl4Deza14uXWxH1YjaqyialI2EVmgT/VkaO+yBHPzfc0K0ztf6jKSJISRFPNUUE97nIF93rN8ohH4tO3jsautIhwRQZSqL8DsAcs0bJuRSht6FJFZOaAbgNJYAR82b7L9YUbBCrsjDCF7qsphHf+9ZkG26c4blDgvv4cLPmOzu4tLksx3y+d3YTixratrnrQ1lZXxFRtoHyXS7GChHTQRybsjOoleFPP7tr9UjNa4eN/Zr062SofFxEkMostk5noHNdpWrFtaDUkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:20:15 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 14:20:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 23:20:12 +0900
Message-Id: <DL4WAGQYJOZS.1RPF3OCEBRQ19@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Rust For Linux"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: num: restrict bool conversion to unsigned
 Bounded
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Younes Akhouayri" <git@younes.io>
References: <20260822-fix-rust-bounded-from-bool-submit-v4-1-aa780bfe7f30@younes.io> <CANiq72mOfR33s4y+Ueivd5NrC5yre+Pcp57ZOBz0msw9A4AP1Q@mail.gmail.com> <DKXA39O66KKG.2PPLT14FCZNRS@nvidia.com> <P0X0ndY--c-9@younes.io>
In-Reply-To: <P0X0ndY--c-9@younes.io>
X-ClientProxiedBy: TY4PR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:378::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b3c877-98a1-45c3-7f02-08df08fd4ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JOK4zpveQ6WiUiXukK9O7E8VglW/JoLEhXh+mDbGqQTJ22exKtBHdxG4XNVRmskiXKI3vFneKmsLoP0DYzFG28wFHXnEKqRcy8ijk9UAUYqLWJcIfhi/l2BSMGrG6TfDn5f1oZxjRFrqnSnV+03Pg4fGgvK5floRs5bqFQtutc1IQ1Tt0l/t/yZ8ZNkVDfyRJCVSk2QLnliR4AqQ+BDKcS/r8bjjpWqjXUmJDe97z66XVazBE7k3l9m6eJ5Xi9sfXuEpU5VnmAvWLsrt3uVgWt0eN2vBUFm/M2FV56V8nNfjibJ+yvp0QPLFjKiykey/DszMt3cuD73kpq8PxijwVFtDFh1+Pr7gMi0d9Xv0AdYaGLHpjyog1l2eK24/jei47KGgnOQsaVisf8ox8XkgCL98nGKMkXewYqBRAv06Uadxpc8PcINKS2DLhonV0BZY4sWe9bqpy/Bfi44/jbScVNkBTW0hdBBcRpoKGWWEC0FMf37Aei5v3R7ueEdp1pIc6kjcGCQd2vAup2ui/qrc+V0mRHAbYE/MlWxlfBDOx6GtYIU8fBdNlsxUvi2TINqlTMzUDgZrUrG8s2ndX/e1m7ZDHr7ZnJJh+ky//7zJQ5JKzIXxzLKs1IrL8OKAf23pjCiJ6lrDkCVmlLOl0VH/1i/yJpARA5ga3MqRPnhAq60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG1ncXk2V3JKbUJJTkI5QWRkL25jZW5GQnJTWXpqRnhDVCtsWWQxM3dBbHIy?=
 =?utf-8?B?anV2cjExd2pITnFaQnhMaDV1akZUQjZIckRGR3RDM2pmREliU3ZadGFjcWlj?=
 =?utf-8?B?dVNhVjZ6N2ZKM2RWMGExWVNhTVEzL0Y2LzRpcFIyb3JEajJ1WTRuVWhqRnVO?=
 =?utf-8?B?d2dOVU0vTC8rM3IwVTA3MU9ZaTJGQ3FXU1o5VHllQitESnhiMnBtY2RnL1VJ?=
 =?utf-8?B?b1NrWEdXUG5zbUxhbmxOZHZHMUJFN2pGVi8wWTd4TjhXNzlvZnhWeUE5QW92?=
 =?utf-8?B?d09sdFg3WGppQ2RjTHNTYTRGekNLeENyZnY2bk41WEVSc0NrRUFiMUdqQVVO?=
 =?utf-8?B?ME9LalNRTTN1d09zWmR5U25WbHRTZFpnOEdKMWlvd2Rwb0paZ2tyNUQvUXd3?=
 =?utf-8?B?QUN2U2h4bVIwYzlMYWNiUnNyRzlKQnFETnd4VE0xVHJBejQzSHJ0SFRYTmIy?=
 =?utf-8?B?RnNrblNRQzRTd1NKVVdtREZpOUFyMUxobFpBYU56YXAzT1J4ODRrMGNaK01F?=
 =?utf-8?B?Z1hWbDg2bFRGdm1DbzAvSDEyalZEenNGejc4VVlYWmNoMDNEV2IzcXlGSmFw?=
 =?utf-8?B?dmZzY1VReFlEZlJvQnJTNXprRXFRT1pOamVmUllhdXBKbkt5TVJiaVVaUmF2?=
 =?utf-8?B?Y3JDYW1WdkFoQXcxZWdpT3pOQ1NQdWovWk9BMU4xYS82ay8wYVBObHlWK3V6?=
 =?utf-8?B?S2JDN2o5NGwyMlZoQjR4S0dUcm1BeU5RQW9tVnBvRzJocTU0ekwrKzNtZzRP?=
 =?utf-8?B?RnhWR3FFUGZzdE5RMktha2NpVEZyYUpwdXVCZGE0a1FSc0J6UjM4VFJKUjhj?=
 =?utf-8?B?VU9MaXFXU0N2a3ZkREQvTUJUdTZlSnZZdHhEZXozUXhBWHBCUEU5bXBwdmdW?=
 =?utf-8?B?bFE1OVR2RWdEMlhjVkIvdWlDNzY5VVJpUVY5OHI1STlkYVZBTkN1Zit2dHdn?=
 =?utf-8?B?S1VXcHJzQVRwTmkxRFp0ZTR4aUQweDg0WHVRWm8wQnZuUXl4UCs0SXhmMS9P?=
 =?utf-8?B?VU5vUlRJWWFaUGx1bnByVzdRQXdnWWNRVXNZMVFrWWwwcWdNdFR0cEJ0ayty?=
 =?utf-8?B?QlFLeU9aUGtabE5iRjV4RzBBcThweUtHZ0t0OGh2dUdZTFhJNGVnSDFZeWNJ?=
 =?utf-8?B?VkttUThVYkYvK2lUZWRqaExUaDBJZm1pMGVCZGhnTTFORVJlRUhtSHptTWo5?=
 =?utf-8?B?Q1R1ZHRJNElMWnZDdnVMRExDN2d6ZWhLbHAvcG0vNlpQRCtWTmRRTFRncWda?=
 =?utf-8?B?L3U5cS9ncmtGOWo1N1B5bENMOGE2WnpqUkNPcS9zQTYxVTJxQkJJRVZjbWVx?=
 =?utf-8?B?VzRKYTRtS0VLTm5iTTZRaVJZNXBRTE1nV25aakZNKzNsbEZwTFJ0SmVqRjZS?=
 =?utf-8?B?aHBFQlJxb2hZcVhWeGRaSEdxL1N1Unl4MFZ4Z2EvWnRRTDVHcFYyRWtYQ1k4?=
 =?utf-8?B?Uzk5U20wYis5RzZSYTlKUElGMkxaN1JsblRqa2JPcmxkdkphc1VmV3JzdjdR?=
 =?utf-8?B?dnpPTm9pbVo2TjdqRk12Zy9mandKTlJxbTZlaDJCUU1scmhwSUVOOWw1ZzJP?=
 =?utf-8?B?OXQ0NGZKVndTRzJTQlFJYzliak5OT0t2c2VsbFVsNzlpT1RMMzNZdk5PeG1q?=
 =?utf-8?B?eXdQNkFmZnVySWs2bGRwZmwyb094eVFKYnFZaVVwWGJ5TmMwSUVYMzIxR0Nh?=
 =?utf-8?B?STBwNmwrN2p0bE1xeWI0WnRnVlFvQXVLbW1nTndrM0lMa1JaV0VUSU1uaUp2?=
 =?utf-8?B?SjdlYW1KTUc4eUpzR2R6Nldod3djZ3I5cERuL20yWTNGbjhtUFV5azR0UHBC?=
 =?utf-8?B?UnhhTThFTEZNYWpQU0FTcVhMMjUvakd4b0g0R3ZoT1pXL1VQb2IzakpvL09U?=
 =?utf-8?B?NGd0cGNLbTJJc1BvVTBpdEpDN3B3ZjV4clZ1NFZVc3M3UERxQTBCc0RYdGY4?=
 =?utf-8?B?V0s3eC9td3lBQ3FySXd4ZXJreU1XQ2dCZUtSUzNvWGh5ZWhEREIwWXUwQlhP?=
 =?utf-8?B?R2RNcUprYUJlQVRtbFVrU1dENHBLWm9wZGoxZkY3ZGRPa2N5V1ptWVdUcEVr?=
 =?utf-8?B?UWVQSjlwNk9jMk04K21RUVZOQjJtbStHbEZZUUxubVpyeTVIWVl4N1p6d2hE?=
 =?utf-8?B?K2gzekJVVzloM2NiZGx4VEdrL3o4Tk5RSkQrSjlBd0NSeExydW5qQ1VOUjFP?=
 =?utf-8?B?bkpWVVdmdnNYWDBzT01GM0RCeHNWWnVmTWlLZTJOZXJZVTRaempnVmRmOFZv?=
 =?utf-8?B?V3dTVlpsRHVDN2xJM1RoMHNDdGwrUE1YTWJUNjNQUjVmMW50MkJMMWFPb2h5?=
 =?utf-8?B?NC9NMGtaRmZpTDZQb0JwVnpkUSs5SFVqR0tEVUFndkx3b0ZUUUgvUWx5T2Ix?=
 =?utf-8?Q?SaHTHi1k2U79MIJMUBpz4DIVwUjVzTkqZciZEFiMU8mLR?=
X-MS-Exchange-AntiSpam-MessageData-1: KL956ZOzRss6wA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b3c877-98a1-45c3-7f02-08df08fd4ea4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:20:15.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F+1zKeKDFoOW+K3mdXFgJMSC0sT9BiiVRiLtKexa+lNPHaIOdW35DRi6EKFc6IW46/KJF4nzklDdrqzk+zlWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

On Wed Sep 2, 2026 at 9:10 PM JST, Younes Akhouayri wrote:
> Hi Alexandre,
>
> Are you still planning to send the patch sealing `Integer`?
> If not, I would be happy to take it.

Oh definitely, please feel free to!
