Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3BE28EA72
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 23:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348754; cv=fail; b=nCVe9cw5JC+TRtJEZ+74HoDbAW5gTIZZu/JrebhBGn6yYilblxW+fCbDcoMyvGaUG81BgAmg8GV2nXRVBvz6+aVPfb4wNndzddWRby5YXUx1OFxCP9KfC00ulN+apXw0VG9W9LvcR5i71KmQWK65SHa0j7X+EJfVxWZz7nSS07Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348754; c=relaxed/simple;
	bh=gmw19rwXW0wXdrkxhPBOYzLed8azP7C4ovRCapKtY7I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PrqGHDvlm1XAac0cTsBP74CEbVu/d+UY2xYkXSEbBnhinzivpTn+BLTT4FJM7doxIJJA3kRrH/oKt1V4TDXtbzxN5YygXaALvmowSRWkVV975L5MVsmOSdm0bKqJziL6KN2v/ysqmIQUczK1cxNznyLYrtEwl3SP5f5yvv7imxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UYTZjrHA; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UYTZjrHA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLABoq+WLPBZvxKnmOVhlot3qSASD1wtPy4IDbq/BaHbz7caH9gnB9IUiX2nn2A0N1uQwdSJc+2wSjtDe5MXQjEIUhsTmf9Q22eaQUCd56ZcJAdmqkjFRPkExlhCj2SJxoiTKpITw0HPUSbgwYeBynQhzTOj6oIB5bpKpaXh5BWWF5kGjZyfRASnvBu+2qldOsQM8XquH3SYT/DJvlh1cOvGtP0QYQ0FGwL7mHhAsFZlFpyTHwTv2/divZVg1vkTNDPun+9c+9sE1WmcqmTY1CTXmbdzybF/H1WVsjNV99hrwRclD2mXkTmV9IqoH/isCJAQuf1zewnDW1bAkaIkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmw19rwXW0wXdrkxhPBOYzLed8azP7C4ovRCapKtY7I=;
 b=DlvN2uhCexA5eoaQVs0jnCDA/0flAe9D1FwwRyLiYk+zocLYGUJrouwBD3jKqarYoqadiO5n7O2fPVaXoWq7wlL0+tjZp99LbunWWwu/pSThUPm8KXpUsYg1CBvGtPwssLRs1cCzgbw+KYOo2/3xniICmrs00o1CyPQCnCPJPXeH9eivd1Cv5Pp7wNfWyded4xfJTSLrdWfG7LxCqTEv0ZwsRSGwaSzCgN+mccHOtgUBZDTny+a0R4sRewrvyau7ky+yhzH8bojE+lEaGrkQLpGZcXs3gIb3/DmNYDixYnuaKtUgJ8R/pxgMbH8M4yi+Ax1Pz1kVcVjUYBpFDXxLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmw19rwXW0wXdrkxhPBOYzLed8azP7C4ovRCapKtY7I=;
 b=UYTZjrHAfw+SuuVzvnY8paxVlzFDf6RBY90b9vbtBm5uQE3CljrFyvSl79/gYKp9qKxbvWjDZZt5AT8hBJRTS7IfmeQ3M3653InpStfb28glN5Y3NwxB6h1Y1SaA8W/vPFi1V1YrrzxFXi2BrYLSCvx+VS4RacMP3RXVOjlIKaoHASFIHDISXwAK5QqmQ+n63+X7o9EVkVIs+ZWXmNiN4zy+/AcnftAdep67uwn+XvyRcRjqQBNgATzr/xft+H1pZjqCH5DAA5BW9HOpClsGuVIJ4kiszzXk1fc2QUMbKiozPTq3NcQKPQoUcxQUbQs2ybYh4rF5B8CdpQgeqFAi4w==
Received: from SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 23:59:09 +0000
Received: from SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69]) by SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 23:59:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>, "mmaurer@google.com"
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Topic: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Index: AQHchN+VGtE8DecVzUS2y/2E1Tf4uLVQujMAgAAEAoCAAAbAAIAAAoEA
Date: Tue, 13 Jan 2026 23:59:09 +0000
Message-ID: <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
	 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
	 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
	 <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
In-Reply-To: <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7923:EE_|MN2PR12MB4437:EE_
x-ms-office365-filtering-correlation-id: e56473e0-9134-4a86-9921-08de52ffbe1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SFc0SGZjbzhxZldrejRYS3h5Y1RSdDdXTjdDdXhmM1NZUWdQYlMyRzlQNXJa?=
 =?utf-8?B?NzJYdXRSMm1jMUxjeW5WVTYwTnZmclp0QVlBL051ZXFPOHM0QW9qSVVtTUY3?=
 =?utf-8?B?djFvTWxWdWJtWkd4OUwvbDhyRkJTSExiMHpVRDg2Y0ZKVVJNSzNDcktHOXAw?=
 =?utf-8?B?U1F6WUZqZFJjWDlqSzhoYmlsQTF4QjNYK29BakZaKzJaWWNnK0dBVzVvcEJK?=
 =?utf-8?B?cEJsSXE4MFBqVkRPVmJVZEVjeW9PekJ4ZzhrSGdDWlVOTEU0U2tzVDVCYm1L?=
 =?utf-8?B?TE1CNDc1SW01ODJHb1JPVm8xNW5ray9NTGJtRG4yQ25RQy92S3hUS1VqOWNw?=
 =?utf-8?B?V01CM2h5NytCTm12b3pTVGdqSGhzelNzL1V2S0hBS0V5dG1WMTNJV0Z5ajNq?=
 =?utf-8?B?OHRTQStPemwrVnlhcUtjMk5nNXRCNEh6VlJpL1M5ZjJJaW12Z1lWTHczeWJj?=
 =?utf-8?B?VzhJMVNqNHlMaTJnaGNoOFNXeU8wQUlmeVJ1aEZrcjNpeVMxd1BGcGdVSHFE?=
 =?utf-8?B?c2dUSWtuYzZHK1hBd2VMdnZ6WE9pQ3I5bmNvUXdoUEZLaHIyR1p1bGRMV20z?=
 =?utf-8?B?b1hpT3JoRmxsdDFLMEFUb2c3VXVjTndEUTYzMXE3dllnR0dRQjhCSDBQQ3d6?=
 =?utf-8?B?WDU4WFpIVzh2d2pLWHNYOGR5ZWE2QWxPVGdCOFcrS3RaQmJyZWk5U3lLdmhy?=
 =?utf-8?B?TkJhOXF3enNLcXo4TVMrYVpVckVlRkxDWk8rYUlPYk1nMUxRSlE2Qittbno5?=
 =?utf-8?B?SDloR2NjKy8yRURPQkQ1MDVVZk56V0kzWUEwMW9VVG0rNkhaV2RYM1ZrMVo1?=
 =?utf-8?B?ZzY0SUo2alhES3Eyck5JM1JxSkR5U3BzWmpsUFphNThYTlV6cnd0QlFjVlZt?=
 =?utf-8?B?bGZxS0piM2Y3MlVJZ3o5aS9FNWVCNkVmdlVhc3pvQmE3N3hFSzhBd3hUcmFi?=
 =?utf-8?B?TVhUTGNBRmUwNG1vTVQ4S0FwMkJRMU5WNWxKOEdqTld5cDVsamR0aVdLOWNv?=
 =?utf-8?B?UnlJTTFYUVo3bUN2b3EwNXpXVmFmREsyK2pvd2tSc3Q1NFVmQ090OVNMeE5n?=
 =?utf-8?B?WGpHRXV5c21yK2RrcGZQV21VTkYvWDg1ck1CVWF3WUhwT1VZVEpXYzQwSlFG?=
 =?utf-8?B?RDJrK3ZyWWdUdHlMY0kxQ2U3Z1dJQkRITUlYS0h1R0t0VUZINnpxUVdKY0lY?=
 =?utf-8?B?NVV2WkNnUWNtNEkyT0VacWtaZFV3ZG8zZjFNMWRIUkxTOTFHZURjYk5xMk1p?=
 =?utf-8?B?clM4Ti9aSkx0alZMUDVvcEs2b245V1FsOFExTGQ3VUJKaExMdVdMdkkwZ1VQ?=
 =?utf-8?B?M1VlR2kvakZCUmZrVkNUUUs2bHlvUTA5M25wTjROazFxMFE4YXoyeVB1Unhl?=
 =?utf-8?B?dWcvWThkTTdtWUF1VG51T0lENkx0UUNjYTJWMnNVTW04bXBsRSsrd0ZnT1BM?=
 =?utf-8?B?Q3JlWUpIYURGeDk3Z2xuU2NVRHVDSlh3NkJ4L2FIYysyeDkvcTllVTZEdWNv?=
 =?utf-8?B?bXZQQU11KytBbWU4T3FhT2YvcDgvV25zVEk4NVdtdVQwUFlhcUNxQXNIK3Jy?=
 =?utf-8?B?QzUrVitzRGRGb2xjRm56WXY5MDA1WG5hZ1U3OHVJb2VHc3c3VmZwSWlRb2NX?=
 =?utf-8?B?aGZpcE8vejNHVkZQek1wQUZLMFMvN1F2UUd0K0JWTHVNVkp5SWlIb1lXSnY5?=
 =?utf-8?B?YnRHVjFlelJQL3hTUzk3OWNUZGZTWEtsMUUzbFY1M29FVVJpeEFXWmxzRzVq?=
 =?utf-8?B?Vko4VWsxWEJUUGFnZytLcCtmZ1ZhZ2ZkcWpkTC80SmxhdzdwSThwanFPV2ZU?=
 =?utf-8?B?bE82eUM1aTJqcHRlNWlhVG8yMHZxL0FjZ1VTSWgwRDRYZHVqcHpLRHJhdUFv?=
 =?utf-8?B?RW1mbFI1SS9jVHBORVFzYTN0RXdlMExmM2JyY3RteXZhVzhXSktKV1IydWp1?=
 =?utf-8?B?YlBmQUN0TmFYeVJJcC93cW8wV3YveTQ4TFBLeGl4S1RkdmMvT1k5dUlRVzA2?=
 =?utf-8?B?VDN0QXgrRnZQdXNlekhqcEpLdTB3Yk9jaXRpN0NhdWh4M1F5RitFNjQwTXdU?=
 =?utf-8?Q?3rKbI9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7923.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXp6N0ZLb0lMUzNXUWVhR0Mzeks0SjZlTUFuM3pra0pIWEw3OWtqa0p0b0pS?=
 =?utf-8?B?YzdLb3JZamFOYmppTDJJNE9mRjNJZHk5Q0x0Y2REeDdxVmNjcXY3S2NlTmN4?=
 =?utf-8?B?Q3BFL294MENLN3EzNC93a25oY01xN0oxY0lEK2RDaU92emtVWE9YQXo4Mjh0?=
 =?utf-8?B?Wi9abmNLb0FRMnJEUDNJNzg4YjJRYzF4S0JPcmt6dVF1cDJja1VBZkVCZERs?=
 =?utf-8?B?V205THNyUXE1MWQybTVhY2ZYUzRGOEdaY3NRRFBsNiszMElzM2dEOFd6ckJF?=
 =?utf-8?B?Ym9FdmNhSzFsclRWY09ERkhRcFY3SmNucG42ZE40Q3J2TTVSYVNCaUNSVDNo?=
 =?utf-8?B?SE1KaTFQWXhHamE3RnBlRGhxMVV4Vi90MmcyMFhKUTBCWU5ycFdUb1N0Y3ZQ?=
 =?utf-8?B?Z3VtK1hmTFlRNEFkaG5oanF0Z0s2QmRzdFQ2a0ZZb0ZQYlNUOHA1aDRnbzFC?=
 =?utf-8?B?cmRPV1ZDbFZiNXdtVnJiMWpyQS9Db1FPVzltQkdKTy8vVm9MQ084SDBsRThD?=
 =?utf-8?B?MmdMYXJ4dGd6QURmbXFBeWJVSy80RXZSLys4TU0va0JjQk9FUVB2NUh6Y3Mv?=
 =?utf-8?B?c0VmM2FOaDE0ZGpGbC9rSXhnOXBWQmxxbzI0TVBGSU1lSGJSUytQbGNwOVJU?=
 =?utf-8?B?ZXRYMlRaTmszZmk4YWVWVXJRSDdpTEovTUx3d2dsM1VFMlNaeFo2ZkdySGFR?=
 =?utf-8?B?VVpOL2k5N2NYVUJkcElBQVFyUXgzTmV1Um9CemcyanV0K0NzU3RsOGVXQllq?=
 =?utf-8?B?Ym0weGlqZER5N2I4Y0FHYURkYmV2Vm5TSGpwcjd4MW5HdE51c0dUL085c0Fy?=
 =?utf-8?B?QnJCOUVnUXpLRHNQQlZyTXFiMEpTRU5CRXBHYnlodVFCUkR4OHU5N3dwdi94?=
 =?utf-8?B?NFZyOXI0bk0zU3l0R0lxRE5yRXNtMkdNRHYybkZ2MzA2YXFZdm9ucmZEKzhY?=
 =?utf-8?B?a05ZQUxqUkFreVNCbkhtZWM5cTREczlFQTZ4WnRDamVnUGFQQ1R5V0dadEFO?=
 =?utf-8?B?MitVeHc0akRRZzdvRG9hVUpEUWQ4ZUNGL2dLQ3lhMkwzTUVrbnd0OGwzbDQz?=
 =?utf-8?B?RkdTL2VBNy9QMkhZZC8xSjhmTjdYbzlVNTdBUzMxTU9KdytJTVdQOGxacmpl?=
 =?utf-8?B?aU5USVh6bFdpekx2SlVnQ3RDUXFVV0ppUkwrWklaSUlmS1lZQVdRVVQ3QkZs?=
 =?utf-8?B?UWNERnhWM21UTnlRVTV5azlSYTFrbDkvSVdVSXF1ZHBHZmRkOU41TTJ1QXZq?=
 =?utf-8?B?UlFpWTdwVkNNdkp4QTRRUUt0WlV4eHpRc01ScEFocFlJUTI5RmdIVklIaXhG?=
 =?utf-8?B?dkEzbDNRU3czVWVBbnJFZlVONnVBOG5KM2N6T1loRkJJUzZHaUlhTk0xT2Zj?=
 =?utf-8?B?WDNSRHl2YVMyUTVWWG83dWtHTmdzMkl0WDJjY0YwK0RZRVMxdVBSam55U0VC?=
 =?utf-8?B?c1FOcm0xSW56U2k3ZVp0MC9tZkJDVWFIMW1jalVuN0ltRGJSVndUKzIrcXAx?=
 =?utf-8?B?eFFtamRMVlVDaEhUamtkSXlVSkxmUktQdkVwWFVpR2VlNlRJcndLOWc0Z1hs?=
 =?utf-8?B?SEl5Tm9HZkY2eVlIQ29FeVJReTllb2cxS0YzWUtqd1RFU2NrdU1XWlp0eHJj?=
 =?utf-8?B?Y05tWU9sNXhDYlFCelhrQlBLN2E2MlJHL1pFWExiemZiNWtTOUx0dTJmOEl1?=
 =?utf-8?B?ZHloa0NZSFFYRmoyV2ZsZTFtWWFqYmRpWVFkc0VGck1UZThkcmVVL1ZRYXBU?=
 =?utf-8?B?UnE5S3hLdkk1TVczVFlLVU5oSUNGT2xmWFhjU2czUnZCdWxPN1ExMnArcmk3?=
 =?utf-8?B?QXJCZk53eEI4Nm9jUTJKS0lLTFRncVJMZkVlalNHeGRZNEg0bFVxM29FU3hu?=
 =?utf-8?B?UUNPY2FIdUZROHR0R24vanRmWTkyTTV5d1VNeWVWdXRSNzBCakhLNUNJbVdX?=
 =?utf-8?B?OUk5NnhuNUtwOUNWT0ZWZ3UwM0F2Y1NtbVVpeWdxQ1pUbWphNGErWmRkcWt2?=
 =?utf-8?B?UWhLSU1WT1BWNE03RG1rbzdteFk5WTVMUkJxQytiQVd3SUM0VEpxUVdDVmYr?=
 =?utf-8?B?ZmpINXQ0UXh3Wi9GUGZtbXZKRkU2R01BNjkyNFdCS00wczNsZGZRTXlBUGZH?=
 =?utf-8?B?Y21xWUlrNXhERldkc0h1OVVOeHhLNWF1RS9wU3lIdTNBSUlsRDhMYzBrNXVk?=
 =?utf-8?B?Q0RkcUhKTWpmdTZYUmRKdmlRTzk3R2NPYzlSU3RkOEFOd2hjMnY5Ymtwb2Ix?=
 =?utf-8?B?VnlyUlN1dk9XRXZsamJNcHBjd1FGOGYrYUh1Tm5kRGFnR2t6N2cxRzUwVy9n?=
 =?utf-8?B?aC9NWUdlTFhGRjVaaTVJMWdkeHo4ZmhpcXh0cDN4Y2IrZkdKd3hOZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A7C817181DA0F4BAFDE0107639708E7@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e56473e0-9134-4a86-9921-08de52ffbe1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 23:59:09.2376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uTtY1iwp3LOUdCstR3rWTVOa4KGkJzGhbgnOiy+S31tYKn6i7m+oMj2G63ZSCR725wfK3dmXwka4Img0JVuSgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDAwOjUwICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBNYXliZSBHYXJ5IGhhcyBhbiBhbHRlcm5hdGl2ZSBpZGVhIGZvciBhIHRlbXBvcmFyeSB3
b3JrYXJvdW5kIHNpbmNlIGhlJ3Mgd29ya2luZw0KPiBvbiB0aGUgcHJvcGVyIHNvbHV0aW9uIHRv
IHNhZmVseSBhY2Nlc3MgbW9kdWxlIGZpZWxkcy4NCj4gDQo+IEJ1dCBhZ2FpbiwgSSB0aGluayBh
IHNpbXBsZSBnbG9iYWwgd2l0aCBhIEZJWE1FIGNvbW1lbnQgc2hvdWxkIGJlIGZpbmUuDQoNClRo
YXQncyB3aGF0IEkgaGFkIGluIG15IGluaXRpYWwgdmVyc2lvbi4NCg0KSSB3aXNoIHlvdSBoYWQg
c2FpZCBzb21ldGhpbmcgd2hlbiBKb2VsIHN1Z2dlc3RlZCBpdDoNCmh0dHBzOi8vbG9yZS5mcmVl
ZGVza3RvcC5vcmcvbm91dmVhdS8yNDZjMWFkNGJiMWNhN2VmMzRmMzMxZmJhMzM5ODliYmFlODYx
OGY4LmNhbWVsQG52aWRpYS5jb20vVC8jbTY5YTIzYTNkYjY0MmM4Y2JiMjJlZmUwZTI0NjQ3ODEx
ZThhZTNmMTINCg0KSSBzcGVudCBhIGxvdCBvZiB0aW1lIG92ZXIgdGhlIHBhc3QgZmV3IHdlZWtz
IGltcGxlbWVudGluZyBsb29rdXAgc3VwcG9ydCwgYW5kIG5vdyB5b3UncmUgc2F5aW5nIGl0DQp3
YXMgZm9yIG5vdGhpbmcuICANCg0KV2hhdCBleGFjdGx5IGlzIEdhcnkncyBjb2RlIHN1cHBvc2Vk
IHRvIGRvLCBhbnl3YXk/ICAicHJvcGVyIHNvbHV0aW9uIHRvIHNhZmVseSBhY2Nlc3MgbW9kdWxl
DQpmaWVsZHMiICBJIGRvbid0IGtub3cgd2hhdCB0aGlzIG1lYW5zLg0K
