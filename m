Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903FD10E3
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 00:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352212; cv=fail; b=Bad72OE9gmWZPszZ1bvp9fKw4psmXHpG0uMycQ29FDBSFGVYGGbWh0C5jjrFzro3KXilccpisNT01rj9rDyzgqbfnVIhddwrDdGKCdeslbDX0UenHAtYka9Pyktmah1pKaFmSINu9ze2honxGtnjBQF+TSmBzosyD7U2sWwl5Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352212; c=relaxed/simple;
	bh=WWP9iZTwOCmk2Wo5sFNZT/w0uv4D7XaHvW8xVXQUhHY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b4jGp2FmqwO1Mu4oii8T0Ues3pLj5cAwcabKddGmg7PcMei6z9TjjSXfMCK8cbumXWrFzgOg7RcfKN3ErH7iIsABEdbflCQTp8kw5/xqqk9kqrPMGm6lx96mh59KHYzJUIueh9GvCAvZ5WHK7m7+tN5G46eQKIwbyLo0iLWvR6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SqyXDK/I; arc=fail smtp.client-ip=40.107.208.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SqyXDK/I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvUz0tKoYNpJcZtx+7OkbA/lSZYvUpSPbzJdx8BCECHSn/6EsjJoyORLG7/jJnb8ZDiSjNGZ83pPj5hVAS6KUczsLf6HI+Pbnhye1U0w6yUzSNI86/HYszR9U1l2/hDlm/ovRr3dkCPMgKLw1gWxTqIrxxFEec2Q2edv+UP2PPoyT1ZpVgg578isEVEP9jnxjW6TN6aTrXKTBd5glrW2GuYnbrnNBCx73F0gR2pq3x1GnrNADzqQcQxWkce4xrzkB6c+B9slSgAjRmmTYQyIomkS3GbOQNOsmShD0a8sURXsgWeya6uIU9IUrP+Vs9MomxFybY2PlCCQpYlJDI7j+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWP9iZTwOCmk2Wo5sFNZT/w0uv4D7XaHvW8xVXQUhHY=;
 b=SHoCGR17b2awSQXITrbh1zhIt0+umP6fvc3iI0qjO3I46x6+I8lh2Pbu+Zek38RC+sYwSvnd6WAxVL5QignewyTzYkQXhhVSJYB6C8Llz+cgZQYqkn9JCEg+9B2J1cDvRP+v0uOL3wLlu3RT0liWtTaAis25il+Pon/sayKoE0EL4gjofBMPDiRaTr40W7VSyt/d1smthDrlwAJGlZ7Tr6Eksvx2lQA7NECa2yVvhHQu2tPTZ69+b1bhbEboFkagRrZ0ujFFe3D7h4UESpJ9/ctVLVrJluWZ9aY69C/bdHdBMtl+bpSiWBW5N0BmiEqHvzi4Tf11GrXC2deLapvzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWP9iZTwOCmk2Wo5sFNZT/w0uv4D7XaHvW8xVXQUhHY=;
 b=SqyXDK/IOr8yNM2rul7w2hG4EO8Io90dugrnIl5maEGH44jI57wd9Dhy8kV4yJRyQYotrkjKnWnTBDMgofNnRwwh/ECAFsgh0B+vkPl+Ekql7ojzxlYDjjM3vLqyzIg0EHp2AUqNFyKrNfdnPcTt9Plqbtb2ZPsOLIXP1iKQ1PmFZ2MgfuhukBLto8fBtU0hWmROm0K5ffBmUBc3dkm94/fzrkzL4/k5jq83jepVDKaOYUesETUEFcSunz1FpiOF/6EEZCPkLAA3SXxOoiGqD6qEQ/aoIQ2dAYRqXVgAdZ3b3iv75e6GR7SOplZ/K2nb8FfplPAAepugNORUdjrERg==
Received: from SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 00:56:48 +0000
Received: from SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69]) by SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 00:56:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Topic: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Index: AQHcfG3W3T8ws8JHdEqtIJBUDe1W2LVPRoeAgAGh7oA=
Date: Wed, 14 Jan 2026 00:56:47 +0000
Message-ID: <227c49fb7b21ad372c1d7c0fcbf1879ef7b7f76f.camel@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
	 <20260103045934.64521-10-ttabi@nvidia.com>
	 <0fcef086-c309-4789-9ab7-a3c4581da6b7@nvidia.com>
In-Reply-To: <0fcef086-c309-4789-9ab7-a3c4581da6b7@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7923:EE_|SJ2PR12MB9240:EE_
x-ms-office365-filtering-correlation-id: f1ad22c8-d590-4740-9286-08de5307cba0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?enFDMkcxNFYyS1pmdDFOS3REWWtIZExIYVBZV0NzNTZzSHkrVloxUGFrRm9p?=
 =?utf-8?B?N2lsWGJBLzRISXBLdG9nQzNYc1A1OGpLZWN3aTM1OWVTL0dPYnRnc1V5Rmt0?=
 =?utf-8?B?cEdXbVpBME42MW4zRnE0NDdnMVJuRmdENFBUVHg0UmNEWVBjTk1ubzA1eVVE?=
 =?utf-8?B?Q2NTWHJIeGZCMUlSOU9tTVBDRmFJd1Z4OGkzRHhHMXZrNXV0djN1d1NVYjdO?=
 =?utf-8?B?TmVaQzZMZ2RaeWNiRWZNVG94Qkl0dTRScXNQclVuZHVrWXBVS3RaVjI4ZVRr?=
 =?utf-8?B?RjFNWFNka2dTTHZOeUxUcWJNSDRDVDdDRzR0UC8wTWw1OWk0Wkwwa2p4SG5U?=
 =?utf-8?B?MEgwYnVvU2xXT3RzTnZoVy9iYU5YMTNhSDNsZmpiQ0pHSjh1dCs4ZXFHWVYy?=
 =?utf-8?B?WVIzQkczQlp2aEhJeFRnWXZvd3FmMCtBU3BGYWQ2UmRkU2t4OGZZMThkbE1i?=
 =?utf-8?B?MHJuL1A0ZXFObHdvOThnaXFtdHVKOFVoaWs1d0luWUVpNVZSNGJ3L1R4cHo4?=
 =?utf-8?B?Q001em4xY0o5UlRya3NMamtFdnoxRUNENmhUM3kxUFZvem1QUjFNanV4eG5k?=
 =?utf-8?B?OW9pT1JqQlZnNVRpVFVxTDRBNGZiMW9nWmYzMGpZQ1F3S0QxY2J3V1k1cTds?=
 =?utf-8?B?SFRjOXJPQ1VyNzNlWDNEQmlhYzNDbnQxWDgwbWw3SFI0SEl0SzUzN1ZzUjhY?=
 =?utf-8?B?TUdJSG9mS2puMXhldzZZREg5Y2o5bXRpYUFjN0NWNlJUNy8xY3pRUVdZRFox?=
 =?utf-8?B?K0cvWnlkcVBPRmJUYUJCTTB2NWVCUlphMndhZGQ5U2ovYlNtam0xamp2OU41?=
 =?utf-8?B?OFdvOUtsb2ZWNjEyYncyYUpteS9SYXNuQUIySnA3WHBuNUJ5UWZLRStCblpr?=
 =?utf-8?B?N2dTQlByMVNFbHR3bVF0SVU2RE1Wd0xQNVY5OGZIREFOOFhvVU52cUtIbTNL?=
 =?utf-8?B?OXRaU3pDa3BpdjNoZ2VUSnJOWVBuelViSnI4VzJiSFBsL2IvN3doNVcwKzUv?=
 =?utf-8?B?V2ZxZ0liRmxzeXk2c0NsQTlxdlZPY0RyN011d05pTmdoWFlESnNNWU9oWEYr?=
 =?utf-8?B?VXVpd3gwS3VIY2RjVWhUaS93azNrUk9URDVjanBOSUFSNDVUR0paOTZCejhu?=
 =?utf-8?B?RUdoWXVkdVVObWdZVVdkVHByOXZEZGxFVGEzcWhkcDVzdGE3anVHME84VXBk?=
 =?utf-8?B?RGFGbkVxYXF3OXhDUVl5YVlPdGQ4dDhHSWlzRDRrbW1BVEZTTDJaK0crOEVP?=
 =?utf-8?B?d2o1MlpiejUvYWcwNjRta2J5QUo0KzFkREh2RGIvdGxFTHZOZVQ1M0YwMTU5?=
 =?utf-8?B?Z0pPbzJ2MXZ3a2tvcFl5VUZRSlNnYWVGUEgwOUJkak14SUlxazcvdTBGZW8y?=
 =?utf-8?B?MnRoelVIbTRycFF2MFZGZFA1aiszS3QxWWY3eFM2V2F5cGtjSER1ME5GTkc2?=
 =?utf-8?B?QUxNQU96QUFVenFIbW9zQkNLY2dONWdzck11VnV0dlJjZWxxTUVxN3VVaWU0?=
 =?utf-8?B?UkZMQ1RGc1o4aHpxTkg3LzI3dEdmNVVLd3pCQ2N0dkZ2M0ozc1VVOFhVbVdh?=
 =?utf-8?B?RitHeC9mS1RXcVRlZlFjVThCRkVKdHNvWmZXdzhldDNjb2h0TUQzYUw0bEtY?=
 =?utf-8?B?ZDFCR1ZNSTVUNTVSdzNvMWlGQTVPQ2lubG1CekI1U1pGSkNkVjlvSS9meU93?=
 =?utf-8?B?ZHJWRk10K2JLVkwwbFlITVpyTGZkbjFDSnZZbzY4MHgxMENyNDBYNDhyOFZ6?=
 =?utf-8?B?YmNyUlNkREp5SWhBeW5BcTJQUDU2ZFMxRmVFcmlURC9lZFg0Y0xNWlY2N1BB?=
 =?utf-8?B?ckNjRnIxbmYzWmVBNXNJOUNQQmk2NU9mUFBmV0J6MVg5Wm5GOWtvYXZDVndz?=
 =?utf-8?B?bEQrVDVwNU1YWkFJK1ErYmFkODQ3TW1tK1daTFRubWp1SFpHY0NYWE5vMENi?=
 =?utf-8?B?aFFEb3UzSTJRcDVrZm9ZQVhoRXRFV0g3OXEzemg4dW1aTGx5WThIYkhLV1ZU?=
 =?utf-8?B?MVRWZDJRSTZFcitLS0crZ2Q4cnVnRlVja0l5Rkl2NEpacFYrVTJYNVNFZFZ6?=
 =?utf-8?Q?9+NRAQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7923.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkJCS3djcmxrbjN3Zjlsak1IKzltdndEVkZLR1N0a2k0allKRWdiWVdYWWd3?=
 =?utf-8?B?Y1IyaW9CS281blprVW51Y3pNQW5BOE9GYWllOEsvb1c4cEdpNElLeWlGalpI?=
 =?utf-8?B?cENEVElHc2JCU1kvMU5wdkkvYWtqNFQwbmg2MUpPTzdUQjdTMGRWczZKVkgz?=
 =?utf-8?B?aXl6bEV4ZXE2T3BzVTk4WVlTVEw3VzI1ckhXU2U3MDdNWDUvMlQvOGMxR1Fr?=
 =?utf-8?B?RE8zb01yM1ZSMFlmdGEvWlYzeU84am9GOFFuSERvdEZ5SEVkNWE5RHVUOUdC?=
 =?utf-8?B?TEdUQmNadXpSOVMwWjNQdzhQWW1nNjVJbEt5Y0VhQTBlOW82WXZhbGdpdDEw?=
 =?utf-8?B?K1I4N0NsMm1rZzJBTUd2ZDYwNkZCL2ZuTzFCQnZ0a3k1b0JKSVNlZVV5VU9H?=
 =?utf-8?B?Sk5oSzBNZjRKQjhJMThiVlFhd0pKMWZlWVV0cU1XZjF6WXVMMi9SenRVYUor?=
 =?utf-8?B?WXdZeDRHa3BRSE5hQ1hzNlFTbHEvMHhzVk1MQStuemFMK2Y3TWRtbXlNcmxY?=
 =?utf-8?B?aEUzOFhlVHlGRk0yQ3JaWnE1VDNHUmJlNDVEeUhIQlVSL1JkT0Qva2lIY1Qv?=
 =?utf-8?B?bGpvT1hWbXZiMUlMQ0sxY0NFWVU5bWRIRGVzL1JOSFBDYjhRUTZqL1hpbUlM?=
 =?utf-8?B?b3VKRWZGUU9JZHhGUmNQbDFJeThtR2lBSDRmQnJOM2c0blhPV3pGSEFNaVJU?=
 =?utf-8?B?MFFYMWxyakNPcFlna0lpZ2VPQVR3QnY5ZnNlTFF6L2JXZXBNS01aTjVobUhy?=
 =?utf-8?B?RW5yVmx0cnlyY3pTdGk0dWErS2ZnbGxSWGNXeE1qWkFGZWc1MEI0MGFMVDBv?=
 =?utf-8?B?Q0c0MHVsdXR4blFEeC8wR0FaZ1owVG5JWUNPQ0hnOCt4S1JlUDNnS2JMZE9r?=
 =?utf-8?B?OXZxaDJpaEhkdUUrcHI4UVVUVlJvT0RlQ1FPbHVaODlzcC82bFBxWERlUk9R?=
 =?utf-8?B?aGt3UitDMStTM2pnU0VUaVZQN3Bvc0p0Uk9TT2wxOHFWWkpKWEwvMFlHODNm?=
 =?utf-8?B?alkwS0VEUE1zTnVOV0lJZno1aTNoVFI1VW1YZ3dmTG1zSS9xQ3BYZkJIQ1lV?=
 =?utf-8?B?UDBHQjh2Nk9kZzJ1SU9DWkVsS3FEMDQ5ZXhObFhNb2VHU1RqakRBNXNsMnZC?=
 =?utf-8?B?VVEyVkxCZG1heU8vY1N0MlByYlpHSG9HNTJGYkI1R3F5NlVzOVhwQWRlMU41?=
 =?utf-8?B?QitsT1NkZUFSeE5uY25ERldsUXRyNDRMbENGRUxFTW1Id0FPdGRndHZkc24y?=
 =?utf-8?B?R3dDTHlwQzEwZ01kVjVLQjZtUFhtMVJzY3phYm5ZSURnUjl0TnIzME02TGVq?=
 =?utf-8?B?S1N6NXpHclJSUWxQOEZYdW5lSmRiWUR3NVpCSTJlZS9oRTdzZEpuS09WaHVV?=
 =?utf-8?B?a01LNkMwYlFPRUI0Z3FkVU1BVzRpcXhsMjVqMno1V1BBaTVZL1dsN29UVGh4?=
 =?utf-8?B?dzlFN1dETkt3RVFmOUlwa1Q5S0JVQjAxSlk1Wm0wemZyTEhJNmRodFRvVjM3?=
 =?utf-8?B?ZDZTdVZpd0JBQUxYQU0rZU5BYk1USlRLTlV4WHFHOWwwN3ZOUEdOR0NQZHdG?=
 =?utf-8?B?djhNRnR3OTJreHcvMG9EY1crSGZTWnVxb0w4cUpadEJiaFhQbUpJdzVtN3FU?=
 =?utf-8?B?cTh2OU5YYUJaOHB4a0UxMG01ZzRHOTdkSjN5MEN4RlpLRHZGS3ErVDhSOVV6?=
 =?utf-8?B?WVhBQzkvY0p3emFIQWpPM3lBYjJ2UFF3eXhVZEVWUEs0WFZkNlZjTkF0cndZ?=
 =?utf-8?B?eWJleGY5anlVZ2l1c3ZuTjhZQi8yaU5DZ0lCTDZxUTUxdUdXUG1IUU1rVG5t?=
 =?utf-8?B?RWZDWDNaVGxBZjhSWGswdUw1eGlOZmVRZDdpV3Joby9kc1YzellmRmRUaUJj?=
 =?utf-8?B?MTdoMktiQjNCTC9aeXVpUGRZQW1kR3FmQkVsMmFYWXNJU2pDanM4aURFQ1lk?=
 =?utf-8?B?RnI3OXJnTmN0dmhqUVhqaGs1TU5lSCtWOEg2RlZhUjZMOGlUdVE4Zjkvektp?=
 =?utf-8?B?N0t2c012a2ZGY2dsNWZsdys3VmI5bkFpNEFLVGZYQUJQU1B1U1FQMTFuUG02?=
 =?utf-8?B?eG9yNGp4SlhRT1I3dkZrdFVxNlhjZUtPb3gyZlR0TGpnUHAzWlhWL0NvVUJp?=
 =?utf-8?B?KzRLVWluMmVkSDlhUDlQS0VyTkt0OVFQVHFsTmUvcm84K3FLaFZzMC85UmVD?=
 =?utf-8?B?RktQZEJ0K2FVZHkrbE5Jckl1Tzk1Z1hodGNyT1FjSjg3a0VXaUdpSEdCNGJ2?=
 =?utf-8?B?dWF6ZEFrSHRReGxpRDZNaFVpb2xjZE95bnlwWjhYTmJ3OW4weFBsZnZsbjJt?=
 =?utf-8?B?bkVvMzJKOG9wZUI0WnpwKytEWUJNK0JQUU5lQ2dBNlIwWlRPVUNYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA349C194C8EB746B88F5677E03DE934@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7923.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ad22c8-d590-4740-9286-08de5307cba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 00:56:47.9335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ea+bNBFT6nO93gy/DfHSCqTPycvowIMYfnORzwDHaE5uaqZgbNLEVhqlTqfjS6c4YjWjfpT7FtcmYqM5Zs2D7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240

T24gTW9uLCAyMDI2LTAxLTEyIGF0IDE5OjAwIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gU2luY2UgdGhpcyBzdWJ0cmFjdGlvbidzIHZhbHVlcyBjb21lcyBmcm9tIGZ3LCBpdCB3b3Vs
ZCBiZSBnb29kIHRvIHVzZQ0KPiBjaGVja2VkX3N1YigpLiBPdGhlcndpc2UsIHRoaXMgY291bGQ6
DQo+IA0KPiAxLiBibG93IHVwIGlmIG92ZXJmbG93IGNoZWNraW5nIGlzIGVuYWJsZWQuDQo+IDIu
IGxlbiBjYW4gdW5kZXJmbG93IGFuZCBiZSBlbnRpcmVseSBwbGF1c2libGUgYnV0IGluY29ycmVj
dCwgY2F1c2luZw0KPiB1bnByZWRpY3RhYmxlIGZhaWx1cmVzLg0KPiANCj4gSSBhbSBmaXhpbmcg
b3RoZXIgc2ltaWxhciBleGlzdGluZyBpc3N1ZXMgaW4gbm92YS1jb3JlIGFzIHdlbGwgYnV0IHNp
bmNlIHRoaXMNCj4gcGF0Y2ggaXMgaW4gZmxpZ2h0LCBpdCdkIGJlIGdyZWF0IHRvIGZpeCBpdCBp
biB0aGUgbmV4dCBwb3N0aW5nIChpdCBzb3VuZHMgbGlrZQ0KPiB0aGVyZSB3aWxsIGJlIGEgbmV4
dCBwb3N0aW5nKS4NCg0KSSdsbCBtYWtlIHRoaXMgZml4IGZvciB2NiwgYnV0IHN0dWZmIGxpa2Ug
dGhpcyBpcyB3aHkgSSB0aGluayB0aGUgY29uc3RydWN0b3JzIGZvciB0aGVzZSBvYmplY3RzDQpz
aG91bGQgdmVyaWZ5IHRoZSBiaXRzIG9mIHRoZSBpbWFnZXMgaW4gZncsIGFuZCByZXR1cm4gYSBS
ZXN1bHQ8PiBpZiB0aGV5IGFyZSBjb3JydXB0ZWQuIA0K
