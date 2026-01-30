Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BD35295C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785187; cv=fail; b=n4qHB9kbIYzDgkaqQxvEIoL/clGTkKr0b3sgtfxQmuaauciBb5LOo9jNarnOAw67wXNXnjVkTKyBplb/EaZnfiRnxGiOzLoBZNCCZx3eqrNw/GYRm/eo9qPGsVAC29Xp8QeTQ3qncjASllR60Pxnpyhl/wNrJkcdGTwH+Q2lhrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785187; c=relaxed/simple;
	bh=pg1ZnnX8CGk0j/6cBm6iSeRAUNL5qJ1knH4zgTZbXq0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jy6megXLYwVvPUpzwGDwD+Zfxc6WbEmku9a4ZTbTjHAoZTp3bcQxOXEWWx7BYjr2GTnEXQdzpLKFgcOEYwonMJqdYuGhN6WZ3QY8NJxDf9musPjTjgr5gyk+FCr+7dP5E9GrMQilqg1Sk7wWmQgqLmyQ5E1gAM3RjALrkpVPn4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LKRyMr2F; arc=fail smtp.client-ip=52.101.52.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LKRyMr2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pR/L7i9GxkWYI41HrS3/O44HkLSYIuNtcMt34xKCF5FUi6kBcCy9S2qF/3P1q6mo/iZH3FKOlx3rS32qZXYCWCk85Eui2KNx5kzeKFA3PWrgbl+BMvNtzvdEfWb1g5x60nF6QK7F8ojb3Z3inaVsIRVBs9vE0FpuqKdev/Apvjq902B7JH+nOFallFB8FPDHH56WGRCckXA4NefvvG2cfFQp7XffL+8kY8WXFzfh/oHfOmQHJCQ0xP6JAapM/ZWAWyFhjmiR9U263vuDjdPDFD6iNMrkb65FX0ISaFAsv+xtzzN3CG5LMMO2gbT4PvyMQ/PP+f0+cswGc+lTIk/nQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg1ZnnX8CGk0j/6cBm6iSeRAUNL5qJ1knH4zgTZbXq0=;
 b=PBLjZ7dA1ze/efXX4K5cnok6LE3d+viE0gaUOvA/9wFNQ19X4k1zkuSh6i3fMmhbKHVMy18G8/Z0qf4GMzPmbtjpuvzARYRZnJjlVUoczPo8XL1G/wWgRwyrSBpp3kT8elcIcHwmGVACe9e7X3Y/NVMwb4BoT7nBWsRHd1ullVz01KhRiGQPQ+QpCE2eMW4AynB+eRWkONjlUo/Wlau5yOPKaumqg7ladhVWdKIAkdzbBIWtU6Xa3XwgTlWj27tLHCjE5yWS5fo492NeH+C/U5iOE3vi5KD+ucKZtexmvSth4qi/JsD67Rv6SMx8gyhxL2YXcoKyApByS/Y8jMzxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg1ZnnX8CGk0j/6cBm6iSeRAUNL5qJ1knH4zgTZbXq0=;
 b=LKRyMr2FKRJRAuN5yoWfJ5x4BnRF5/m72xq0iBCJ8Zvd1Pu524+/1Lkbg+/VLmtQeMupjHtKIeXRMUdRbgfQ+moe1OcjVBQESuJ0Q+3Z7g+0kA//wrx0qK2lBShm5Y8uXE5DQVHUpc7Bux+fghA+wOjRiJRhWuQQSoxpQSPsxPtPh9ZISbib9hRv886tkx+ek6Vdg5U+qy5JjpBd62juOeEjyzieosCURdU0EhjPQa7tFh4HniNbWYkQ4VpsWkxz3iE2vwePiHTSJp7RSsx2INLhajB0ZTQUT/HH1uZFFnWXp2d9QVNUkBcT70gfIZMO6sprDqE1k3Zr3xtXsrRR5A==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM6PR12MB4060.namprd12.prod.outlook.com (2603:10b6:5:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:59:40 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "aliceryhl@google.com" <aliceryhl@google.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v6 6/7] gpu: nova-core: create debugfs root in module init
Thread-Topic: [PATCH v6 6/7] gpu: nova-core: create debugfs root in module
 init
Thread-Index: AQHckMcNm1BDVn65vE6uGeyXK66Tz7VqZPiAgABrloA=
Date: Fri, 30 Jan 2026 14:59:40 +0000
Message-ID: <c92dcdd1ac404acc185e355f0d7b08ecfea235eb.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
	 <20260129022837.4133832-7-ttabi@nvidia.com> <aXxtG0TTk376dRsT@google.com>
In-Reply-To: <aXxtG0TTk376dRsT@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DM6PR12MB4060:EE_
x-ms-office365-filtering-correlation-id: 4cc2371c-174e-46b2-962b-08de601031d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUt0bENWa3IzelRlQkRIQml5L2dBcFlwaDZDSFJ0eCtYMkVwTDlvT05LVmVu?=
 =?utf-8?B?WHlzU0d4cTlBWk5qWWR3QXBHSXZIdXVIdjI2RUg3aEtJMlZSTzdFNDJySkpY?=
 =?utf-8?B?cUdneDFkRXFXeUc2dERaMGNJVTNrb0xtRFZvSUZhblFEclRabEE1WHlQOEZO?=
 =?utf-8?B?amx0RVFVelIwV21TNDBtbGYxZzVXRE14YXkrcXcxc0oyQnQ2enhXOUhmRVl3?=
 =?utf-8?B?c3NUTXJyMXJIT3hIRDNvek1RMXdBbURFNlNPL25mZHRLRStFN1ZSOE1URklE?=
 =?utf-8?B?a25sSHdiRjVhVk5hSlJxZUZjYlF3aWNOTzF0M1dRZTR5RWVDTHZtQWQ5bDgz?=
 =?utf-8?B?UWZzeFFBaTlUUnhUT2RQR212NXM4T3puMWh6T2RuUENXUHVwNXZJY0QzTDdh?=
 =?utf-8?B?Q0d2L0ZhKzM1dTNlQ2ZwL3JUd1JrVGJqZUVkL3NHMEVtbGdWNEhZQkFFdTla?=
 =?utf-8?B?VFdwWXNkWm9FLzZZMmpPTEdaRWoxOXMyMWFEQUNvQjh4QUF4MHFLRFp6ZFdR?=
 =?utf-8?B?cDg3WGxHdG9mYXlueHpnWmhuQzRHOS9yU2s4U2ZyemgzRGVZK1FLcHhya1JG?=
 =?utf-8?B?Ti9hcGJBNDFwRWcxeWFqbk5SZmxjbGNNSlUzVUNJRDMzb2FaSDZ5Q3RqZ1kz?=
 =?utf-8?B?a2loUlk4c0FTdk9KSzNpZmpLMCtlSWM0c3k3Y05JY2dXOXhreWtYSHhtdmRR?=
 =?utf-8?B?MkY1RWpUSHdPMnpTRVcyeS9VVFh4blJpNjJIa3IwSkthRU5ZbE9EOWR1RkJq?=
 =?utf-8?B?Q3Y2YXplM0ViT1QyeExnTENaK29MeVQ3cHkxS1p4cGMyd0FsL0kybWFWMEVi?=
 =?utf-8?B?ckRWTWV3ZlhRZGJXMTUwaHQyc05zY0pEUXJNL3dsY1RKZFFqTlpOVk1tRG16?=
 =?utf-8?B?eWp6engvbEdFOTlIdS9PQWk2U3JsRjVEOGYvcWF6UndFQ1BLWndqV1hoOGU5?=
 =?utf-8?B?VTc5MnhNd0NaSkp2VTJJZXg3WVRyY1FFODM5QjdZSGhoQXp1b2hCL05Da0lR?=
 =?utf-8?B?eEplRmhtSUw0Qm1tQ2g3RVNsajd3eURZRXk1YitpVzl3MWxZbnR5WU9iUEpP?=
 =?utf-8?B?WVg5eTdxSHpWNkFGc0FDaTVvMVRQcFUzYXpRTG56TkxLajU4QUlaU2JOMWFi?=
 =?utf-8?B?dDJOUGx1NEpzNncrZ2ovQ1FsNjY3M2RONnZSeTkxM3FSd2h3Rjd3VEhlU0Nn?=
 =?utf-8?B?elJtMEpONy9sYmgwSlhURGlZZkRWMjdtYUZEV3o2OU50M3Y5eTN1RTczKzZh?=
 =?utf-8?B?ZTZiL1NuODFlYW1SMFdNYzc4R2JCZkNqdGFpbU94RGJheTBiNGxnd3hlZ2FO?=
 =?utf-8?B?UG1yY3JCVzNIbHlVdUtaZktVZUU1TmRsK25MMzFtdTFIcXZZMVZCZHVXVTlr?=
 =?utf-8?B?Wm5jMW91M1JQU2RURU5KSVJxOXhBSDQ4ZzE5Uzhta05rQkpCNUY3OEVFeTlT?=
 =?utf-8?B?SjI2SjNEb0xVdjhvdGtITVJjdSt1dTRGUmlwTEREL3NMNVR3QkhUTkMxbm1S?=
 =?utf-8?B?YW9pY1lCZ0ZETFJUTVI5SmlKajNOYXo1bi9NQVUxK3R4TVVsb3l2TDRMWmRq?=
 =?utf-8?B?RTdkU2M5SzVQekxuN2FuUkNITm9OQVhDd0xQR0l2Nklzc1ZadzlKelk3L3NH?=
 =?utf-8?B?dXhrT0ltOElvVTR2YjlROTNBMnI5TlFlUXRLdmt3NHNhM0VIWjJ6VkV5TlZG?=
 =?utf-8?B?emRYeGtMZ2J0elNXTk9XWTczQWtFRi9BanVWVXFXVDZQbktUbTcvdWEydUxy?=
 =?utf-8?B?ZGNVb1VuaXhOdnIxMlVpcStweTZ1bGd5dlpZbmtZd2UwUmRaMFZZaThBT3Zl?=
 =?utf-8?B?M0YzYW4xeldGMUtCbE9XV1pGbmpuNEx0U3ZNNXhHZFd5QnBWb2NtZEhIWmRP?=
 =?utf-8?B?dlBMYk1tVXlhUjVBVjErcTZFK2pzK3FxM25PTHVjZFJka3NUUU5KTUpEVTJR?=
 =?utf-8?B?REhzZW9EcjhDUTliV1RQd2JqcE1xNUcxaG1oUXl0OXF0a24xcWNzaFhCOXVS?=
 =?utf-8?B?Y2RkWVdNZ3NZOTRyNW9TNm4rYzBsRzZiK0ZJS2FsU29UWEp1VlVJR0N3aE4y?=
 =?utf-8?B?K256VGpJdWpucTQzWXJhS2QrVVRKWGVyVDhIeGs5R2JiZjY5bmE5Qk1UQkl4?=
 =?utf-8?B?cTJQSnNsTy9MTWpIa1lSbXBOZEJQdExndTAycm9uTXhyVDRMOEZuNm1LNWFV?=
 =?utf-8?Q?PYl9dPPqp/ALxqaqRQzhXm8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3hvQklqbEd6SG1TUzdPWitGUEpxNXBWRGZzMEQ2ZVZacFVXUVEzejg3bUVp?=
 =?utf-8?B?aVBONGd2Tlh0aFpHd1JIL2prbUVaZ0V3bGhtcFlrNmRiQnJraGhhejR5ZC9m?=
 =?utf-8?B?TzVvdTE3dXVWZ1BjOXFYcmx1YlRPc1FHNENCSWtkRmNXM2RhSjl6ajdPbzd2?=
 =?utf-8?B?Z2xrY1ZCV0NOSlBUelUySC9pSU41bVV4cGsyQ05IaE9vdzl6d0gwVWw0TFBX?=
 =?utf-8?B?ZElBckYzR3JNK3pEbWRkUFI3U0FyWDdpbWM5ckpkeExBU09pTTlNSUgxTnVW?=
 =?utf-8?B?WmRXbzRmaWZiVUFqczlkQnJ5L3hBN01lZngvVERpTTFJOWJaRWVKV0taMlZt?=
 =?utf-8?B?QW5EU0U5NmFNRE5Wb3prdjNVeFJiaXRjNmtsWnptbEc3Y1JiaStNdW9MN0kv?=
 =?utf-8?B?aURzUHFTb05lc2IzbVl5dHBrU3AzcmNlYnBlMm9QUHM3MW44L0gybm5Jd0RT?=
 =?utf-8?B?NjdXeVg2WVEyUkVNZHdwSDVoOEdwdXhzZXBJOHpaMDVQLzhibUNnby9GSFFs?=
 =?utf-8?B?QUFCSWhvdG9YdmFMajZTR2s5Vy9QNHVPN1ZUZUhhbXVVem8xSmNJZXVCZ3JC?=
 =?utf-8?B?SHJvL1JXWStrR1U4MC9WbVh1bmcrb3VNM3E4a21icW1FVTlnSFB5UmxvVmdm?=
 =?utf-8?B?TzErV0IvN3diV2lOYnR3OVdCRWtVeVdiNy8vcFQwa3hHM2hGdk5hWXhsck90?=
 =?utf-8?B?cnorSm5IRUtvNE1QZGpKOU8weFBnbkhEd1dvTkk4SCt2TWE5bDBIMVhiZ0hu?=
 =?utf-8?B?aXdRRWZpQUdxUXNMQVZqOExFcjhxQzU1SC9IOHFwc09qOGVZZFgzM3pXVkZK?=
 =?utf-8?B?RHdWMlhvbG1XODJnUHpxcFhFSzBaaFNXT3k3K2lHNGlJWjl2SHlKMzZPS1Jq?=
 =?utf-8?B?NUZCWXV4NkVCejZ5aTJQLzlmbTBFeVZRWHR5M2RWRzZoSUM3TzRad2xsd09y?=
 =?utf-8?B?elNoODZPcEFUSHBEYXlJUld0V1VHUXhwajgvV1dxdXZuZ2dGVXJNUWkyOW4x?=
 =?utf-8?B?NHR4Vngrbkt4KzhJYWZTWWFXQzhKKzhMa3NSOGtBM0tiK2ZJdmZvRGpxeXVs?=
 =?utf-8?B?bE43N1RoOU44TE82UTRiL0RBVkF1NmdXWHhSNWM5MWw0Ky9mL2thT1hrcTVU?=
 =?utf-8?B?WUR2MFFPVGhKSUo5MGV1OU0yWHo4WUhMOW5jcUQzZndIZkVsSzI5ZlVUMVZT?=
 =?utf-8?B?VTl4ZWcyVWtMV3hvazl4b1JhRVFIZjZtTE1qYmhWdERTSEtzYlNMc1ZmMTIx?=
 =?utf-8?B?NzJqalFCZUwxOGM1UXg4cndRdUpOOS9xTDNEa3FGcFdhcm9ZNTJidE1FVWps?=
 =?utf-8?B?RUhvVklLbXFTREJsTFAyeThlNFBIUTRnUjJvS1dKOWVuNjduZHVYa2l3YjM5?=
 =?utf-8?B?OFczeU9Da2hpSCtHcEF0a3JFL0h4ZjlFVlJCVFBCaHFiUHJiTDdBU0QzYUg4?=
 =?utf-8?B?OEZ6bmJnakRhREx5TWhHUnYwT1A4ZHJjb0gxUnhzZGdWaUJzVVBMOTlMc2Zi?=
 =?utf-8?B?d3pQZU01T1R5d1U5V0JBdzU5Y2JwUURKWVFNUU9MdXk4QXFwRWdUblNIdjFX?=
 =?utf-8?B?NEVtVWxGdDdMMDRTeGk1Vjc5NUlrVXpYNk9kY0h2dzE2bHZhRVpXOXBUcFY0?=
 =?utf-8?B?MDg5dVQ0SVJlV0NNVHVadVJuUE5GM0lLM2NXUTMyOUpJSld6ZkRJK0YxYU9u?=
 =?utf-8?B?U1FCd3I1RmpkTHk0QzVMV0ljckl5Wi9RUjhBQjR6eUVvSkNGV0ZUNEUrQWc0?=
 =?utf-8?B?OVdtdStlQjZ2TmZIMGVFLzJxQUJwbk1MbjRQMVRvYUo4YnQwSjBVYnU0eTBt?=
 =?utf-8?B?Y2RlY25VQXdpZ3BjYUVWS3pVOHZFVWlpUFpobFU1Z3RmUkI5VmpRZjh1ZWk0?=
 =?utf-8?B?RTRPKzIybkNSUzB0SFFzQkh3WDJ6UDdScnRtYzRLN2tNb3paVVdtdVNYc2Yx?=
 =?utf-8?B?djErWlRuL0I4SWR6aERTZXdiVGV6YzQ5T3hTd3FkRmtrQmhIWVFSWWRvMXdP?=
 =?utf-8?B?WXpSa0xidWdmOEthTHIxVUdrTWpyMlhRaVpSVWtBWFRUNGZEeFZJZk1zenMz?=
 =?utf-8?B?a1U0UUpVTnhZT0RUbFczV1N2QUF3VDR4VHNIRUtSNjhid2RaODlSNEFqcC9C?=
 =?utf-8?B?eSttb2dMS1FzVzkxd0NhVGtQazlLalU3WDY5WERRdFlJbkZWWXF5NkF2Qmgr?=
 =?utf-8?B?NDh3VG1iZDVUOVJJdllMM0VSbTVzYy8rMnhPelZrRkF4clA4RnZ0a3VzdTNs?=
 =?utf-8?B?cUdwSHpIQmNVbFYzeTg1cGNvb1NERjZzRWtLNTNpUlNCWCtobWwyLzYzK01x?=
 =?utf-8?B?azNVd0JWd0lDUEpPYUlRUFZZcHhoY3U1am1KUUhQdW5OdDY4bFI1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10364FA2D2036F4DBBD1A0BB78EC5AC8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc2371c-174e-46b2-962b-08de601031d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 14:59:40.4874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYOY/DTn5VFVe2Xs4G6HTJHC93w3IpWOoGYuEVzNqK0dQsHr2aXCc6RxnqkC2PVBOg23D/Im+2UIQQNalwXmZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDA4OjM0ICswMDAwLCBBbGljZSBSeWhsIHdyb3RlOg0KPiBP
biBXZWQsIEphbiAyOCwgMjAyNiBhdCAwODoyODozNlBNIC0wNjAwLCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+ICsvLyBGSVhNRTogTW92ZSB0aGlzIGludG8gcGVyLW1vZHVsZSBkYXRhIG9uY2UgdGhh
dCBleGlzdHMNCj4gPiArc3RhdGljIG11dCBERUJVR0ZTX1JPT1Q6IE9wdGlvbjxkZWJ1Z2ZzOjpE
aXI+ID0gTm9uZTsNCj4gDQo+IFN1cmVseSBkZWJ1Z2ZzIGhhcyBhIHNvbHV0aW9uIHRvIGF2b2lk
IHRoaXMuLi4NCg0KWWVzLCBkZWJ1Z2ZzX2xvb2t1cCgpLCBidXQgdGhhdCB3YXMgcmVqZWN0ZWQ6
DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ERjE4UkZYM0lIVlAuM0dZTkpJWUFGRkpV
NkBrZXJuZWwub3JnLw0K
