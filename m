Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF92D9787;
	Wed, 28 Jan 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602725; cv=fail; b=siVUdtB6uZSnqGZUsAF+3nX11ptnTgYRbKDm41kgjUaHF/zAUAM67+s0psqMPJLdV0DQw4PGJWUcvfhZRils2+Vx2YjjI2/rX0V/6hSGstFs2lQkCsCXe2L+9a6Rh38K7mYLjffT0WIamFdOhVt6heCtqCVdza8eNyfI83ZiGhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602725; c=relaxed/simple;
	bh=3zrcgUjpYgK09v+f01WpnAiG7o1JhbgvNad6uevqTB8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kcA5z+ywYNwtXXuG8Q/Y/UsIrV6yAkvnOn7KsHAMlEx5kIHRpw5SHoCNTBrVqjyGR6clzGuxXOog5xEmdEKKFCopHex4ZBEQg84GQlFeBZW6mhCkAz8HXheoNAriEq1vhWZ+7OwX/c1iabhKsTNFa7ZnR9Pif2g72v3L3ShEp7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hkey4uQm; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hkey4uQm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV7iviDexQ/SspZyJciGc9akq7P5iBk/jkZyAPitpM54EdEsfg4mHbf5aypEUZMctlQjxI2HSmuEjnsfMavp1xacoCpfgwICUBYrDzSeOynaRKoS0mrr/xoLzYFmiDRagHnjLSJBGDcHsyZsur43kOIejUCffglrk1UnRsMt5PjxjPegocu2kp+p2rVVoVSbXP3sIyRHZhKBcpL+v0cOqk8oVcOrHn/buznSBsZOr7Bue/Y/2u8lB3E8zwSoPYXGyTXrsRLzb2nw8OtKU8u7faf9k2Vg/KI/i86ipHOIdFS7JfhpS8P9qRX9V21eH+tZmJS0J2nwEPYKsQZgLwJO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3X/N3YSbdpZCgKVGQmQBwMoKXKNWPQwSbAFBAtA3W4=;
 b=giX6OOSY9ThER4nG20sY8CPShitekIN2O5b7XwmhrHh0Av4oaFFDEhv22VQguYSgzvmOn6e/4kYsGHCtfsGu5olGpAk7j2wkY0daAM9cmlcCs1KL5Jq+fYjXVYDC+UIOVlehe/yawsNIMLFdjV2vEUUAkLw/Ptg+TaX4/HnN0IesFACk44rGyVghRc/tMaHnFV1FTQvil2uuRmJ4ZAaz+0Y7RbZOr1eW8p7IIGFGJxz+HHHx3vPgJCSYPalfk07Rfp1IW9bCRpPzcpfDgYnYytouMeQkDnDOxpJSdBHmQuVPOY5J4Nhkm1OjHRs1N+XwN0C0KkA+jAW8eOnsduxbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3X/N3YSbdpZCgKVGQmQBwMoKXKNWPQwSbAFBAtA3W4=;
 b=hkey4uQm9g3pq9FMqs3in8sjMeMODFhld+EKjes6VxzzpgTQpcfB1WqEwHEnklrQKm9kTQK7h60vFHkhHkD5SlUlP/LacTo7ixYEu0IBoTVEKQzeniL4hFKu0B86M4kAr4QU5MGzHUlzCzIOc40LJVOBNfWj7YtRy9Zh9PWShB/R9O37ieNi85r74w7RGU8Q5z/iU8RtZy5L/3HFiofFaDmltXR0IWzuXMYhtTOm4vYfmGP6Ywd3nHM/JhBLdBY7gjedCBHJ5J9H/NWkdRtWfGt5rn7bGdVFE8M8w4CQ421IaImC7s7A3QWEN1GYPSyLeDUfzApJ9EEkqlUMTSIeYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA4PR12MB9762.namprd12.prod.outlook.com (2603:10b6:208:5d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 12:18:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 12:18:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 21:18:37 +0900
Message-Id: <DG07T5OKDVAR.2PJRWMXMGS316@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
 <DFYQGXHPBZP7.O34DZ6RTDGU0@garyguo.net>
In-Reply-To: <DFYQGXHPBZP7.O34DZ6RTDGU0@garyguo.net>
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA4PR12MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaec9d9-83b9-4e1d-6332-08de5e675f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0dCc1l0Sk1NcCtSNW5taGxwbSt2eXEzMXFxM1FnRGdCUHFlYkF1UkxqSmk5?=
 =?utf-8?B?TW9SOTF5b1N1S2NWRXVmTHdpSmRQOEUyejJXN05rMVJ6Znp4aTkyZlA1RS96?=
 =?utf-8?B?ZnljRXBRUzBtODMzcGtMc09Mc041Qjh1bmpEZjcyTGJ3R1pCS1h5T3NWYVFW?=
 =?utf-8?B?c0IzdG52Z1RFRFdyVm5kYmV2elpTcG5GZ1dvVW9VWWpXKy9yTzEvaGNmRHA1?=
 =?utf-8?B?M0hnZmRJeGJ3ZmVhZlh5QkhRcE1vN2dkb0pyU3hKUzZaQTg2ZmtsZXVaZk96?=
 =?utf-8?B?N1FkOVoyQVVNOWQ0amdiRWlkMGU3YnROTUhCdEwyNjRad3dMSHo3QzJiWWJx?=
 =?utf-8?B?TnFwdkJyeUFpTHhsV2hINjRjaHdYckpVdEFUcGY1T1F1S1l2WjJsYm9HVkVX?=
 =?utf-8?B?MkZhYjFNVmZCWEhreDBHYjdsS01MQ0Y1ZUxDWG5YbGNCMDk5aFppOFVqZVg3?=
 =?utf-8?B?eE5pTzk0NXh6TFQvTzVHaWZldHU5cXlMOHBPdDNab3JFdnB5Skx4TXNVREx6?=
 =?utf-8?B?QUlDNlNxOXAxMzErVkJyU2s2QWIwWmNNMWFsYWlnSXdHdFNnU1l6bkt4SFpS?=
 =?utf-8?B?TnRkTzJlWmc3VG5ldkhZTnRtNnV0ckEralFoNytnMEN4RHNFdWhiMGdqMDJN?=
 =?utf-8?B?M0dCUUw2b3pSSTR4Zjc0TXFNZGxZdHAvY2RocXcrdURCNlRLVHRHajlEL1dF?=
 =?utf-8?B?RXFtWCtPd2VLVVR1dG5PRTN0MXRyN3NVcGg1YlZKQkRrZm1oMklFUEpxa05T?=
 =?utf-8?B?L2IwNjNpb0xKc2RFN3NhNUtFSEJUWGE5ejcwdUszeUM3VDk2cHAraTF5eGZE?=
 =?utf-8?B?a3NWaWVWTUFHcUE5TnZxaG9md3gvWktUNjN1Q2FsVTNRU2xOMFNIRGpqc1VN?=
 =?utf-8?B?L0pXdThST1RWK1RjT2xnNStiWllvVG9yL3E0bDQvTUhLQlhnVzliKzhYMGxI?=
 =?utf-8?B?T25vZVN5REQwSE1OVFhPZmFhbXFOdXJQbVhyWFNrN2ZSaHY3V2xuSms1THRP?=
 =?utf-8?B?ZTc5T0FLd1NPaDVtNDg1bkJtOURKZnRiUEVuYjFSY2RGRkhyZTdnMkZtY3Ay?=
 =?utf-8?B?NnN2eVM2ZWFidlc2SkMzcVdHYWFqc0F0cis4Zm15MjV1RUhVcy8xZ0pVMzJE?=
 =?utf-8?B?bHVRUDF3Vks2Q2hpRWpRTng1c3lrczlmWWgrVWZJQXFRVkxLUHU1ZmFRNUFy?=
 =?utf-8?B?Q0lJSTA4bWlFYXI0VHI4aUlBQmYvS0kvbUQyT0pDL1BacEEwTlJiOEZaYmpU?=
 =?utf-8?B?WTkxS3BMMDdXVmdYM2ZVK1FYVXZqUjhaUUtOeFZFa2QxeUJDaktXc0UwMTE2?=
 =?utf-8?B?N1l0VDRvdTFDRXY0WHlRajROYXR4VDBYT2d0dGt2emdxNzRpUXlrdmJONll0?=
 =?utf-8?B?bmhZNGwrSHE2Tk5RaTQ0NGkxWFc2ak5EbzZsM2F4Yi9yWTltdG5aZllsSWRt?=
 =?utf-8?B?MlkzSjE3dFVHMWRoZk9jWXBzK0Qyak5VUjNpMnJCbmQramh2U0JHZVZYQkFz?=
 =?utf-8?B?OTJuM1ZEZ2l3UXByVG5kN1ZrSG5aVk1EMVhtRG5meHBOaWpmWmxnUjdlL3FJ?=
 =?utf-8?B?STNZaTN4ZVc3Q3ZURGhvV1AvVDdHdTNidk9MZWpDVnYxbkZrY28zMGhTTGVl?=
 =?utf-8?B?ZDdCZzVaMDcxbStUVFo4L2tnTGlWQmhTcXYrWXlHeUdnQ1pSckdWcmhjdlRT?=
 =?utf-8?B?SFdGRnFVcUJ4YUNZd0NBa0o2dWpFRUEvaFIwemtDOUhvM0ZESVQyTDhwTEwy?=
 =?utf-8?B?WVZLUDFzdm40V25ZaU5YVzNZMnhBZUxYMlovbzk1SE01bGd1Q3RTWlU2Smgz?=
 =?utf-8?B?ekRDbXlBNmVYQlYzb1ZPNmU4dmtvQXVlVGRLUTNUTTdka0ZXL1R1ODAyamw0?=
 =?utf-8?B?alZkTVM5N0JBbXNxbWwxVUk1MldCVWYxWjdmZnBnUjFVKzFJcGpVUEcxYlc2?=
 =?utf-8?B?RCtibFhhRWNLSlkwU3p1ZUk5NGxwM2UwKzlzU3JBZUEyYmF4WXNuRVpLRFVn?=
 =?utf-8?B?VGkwb2xTc0VWck5HN1B3TmYwUm5oTVFVSDEwZU1IVWI5R0hEN0NDbGN3VE5B?=
 =?utf-8?B?dWJlVmUzNENMTFBnMzNmSW5ueW1hL1hnMlZxNU1jMlhwTmlqS2R6RERBQTJl?=
 =?utf-8?Q?vx/o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFkSHZ4cmZpUU1mTmlMK1FXSFZpaFBPVVVYSGw0Ymd3SU85RzFzbGNyUE5G?=
 =?utf-8?B?ZE9hazBGMEl3c25TZ1F0eEhvNCtmdCtWdy9KR3ZTUVpDNVl2cExSRDdmek15?=
 =?utf-8?B?dThPQ1VuRE1lbE9wSndINWhBRlltWVYrRjRGWUJjYkdjakFiSk82TVhlT2Vu?=
 =?utf-8?B?eXgxTndCenkwcEozQWhpVGxiN014d1k4RzA5UnNyb2xlNkkwQ3BjNlNzL2JO?=
 =?utf-8?B?UE5VWTY1dDVyK05WTFVNaEdzZDMwUGtwbk5JOUhPUGFDUkJpVElsVnJTbWk2?=
 =?utf-8?B?Q2VQNjN2cEF3MnVwVmxlZHVYWWh5eG9JQytKN2lodklla1pDT2JlZlAzNU5O?=
 =?utf-8?B?NjBZTUl4WXYyK3UvOXBXNk9UMm9id283d3FpT3hQb0w0azErU2FpeVJvd25V?=
 =?utf-8?B?bGFDR09VRGpZZjdHbUJXNGdmclNJc2wvTUMzLzRwUVZFQUEzL1g2NGRRNkZE?=
 =?utf-8?B?aWE0cnpvd3duSWRIdkdoV1FtNG1SN3QwcVgwZUZ2b3VvNGNidVY4MmovNlRZ?=
 =?utf-8?B?T0c4amsvamdCeXpxMkZmWVpicE5HYWhSb3ZMMVRXS0NPMk4wZU5uTTRNTFh4?=
 =?utf-8?B?OEc1OTN5QThrNGxUekxyclRyTDZ0MG45UmJxbkcxR2JVM0piL0VnaDZWMUZk?=
 =?utf-8?B?NU02eWU5UnBJT1lOL3l4MG53L0x3OGNsUCtRS3Y0UFNPTnBOZFdYYllVQjVz?=
 =?utf-8?B?YXJiRExUQjQ2SnNjRDVaMHpPb01reEdZNTg0MDE3SEV5SjNVTzg4aUh2K3pn?=
 =?utf-8?B?cWFNOEFaazNwanRrZkVpWmpnekJZVjlyMnB4MjlnUEdTT3h4aWp5N3hOVTB1?=
 =?utf-8?B?R01HWFY0VGowcWQxUDhJZU16NDlpY3ZMZU5QMzV6RjVBYlJqaVQrMGcrS1By?=
 =?utf-8?B?MzVZUzBrM0w2UzkvM3IxU2drS2c2S3BnMUNHRTJXb3NJQ1luY2J3V3k0THMx?=
 =?utf-8?B?eFUzcExBT3NyTWhRRldwUTFsazJpM05HbHdEbHl2UWoxa1NIM3kvWUNJTWxR?=
 =?utf-8?B?K0wvSjIwMGpJWmp3b1h2eGNuOWh2enJBeER4M2hxK3FQMWZ2SHVSUloxckNv?=
 =?utf-8?B?OUJ3ZkdObWY1WlJqamhCakt4RVFRbTZ4cjhWMTh2bWlQVUJqVkgvakRmTW1y?=
 =?utf-8?B?UXFPMHNyTHdyVE85SCtVZ2NHbVZrdUR6a3lSbVlBdEZ0TmdURFVFU1lvRnNs?=
 =?utf-8?B?SnNBZSs5YWlBb0w4T2tEdVVqNEFsbHEveUZqNGd4czlNWGxiRVVoYWk1VzVz?=
 =?utf-8?B?WUhSa2t1bmRXN2E5akFuQnRHaGJBeERUZFFPRlY4QjY2TGRyZ2JYK0t6YUZI?=
 =?utf-8?B?eU5HdzJ1OTdoZ1JSdXFqbFl3N2prME4rQXN3U0NhZGpBNkpJclpaMENJYksw?=
 =?utf-8?B?SzhiTVRsQUlhUVN0d1JpYlk2VE5UbVgwekJGVVlXVlU4N1JKV2p3N1FLNFQr?=
 =?utf-8?B?cGpudnJ4d1ZCQ3dDbnBEd09jVFBiTHkzTWFRMys0OVF6NW92czY5NzA3ZUI3?=
 =?utf-8?B?VWFWZ2RxRFAyMmtEUkRLdVFwZ0U2ZGV1RWRaeklpaWMrUmx1UlBKdlVScGV0?=
 =?utf-8?B?cmVlWTlnbHlNUkNpcGQ0c3JqN0Z4TkpiOGx4cTJQeGQ0bFhQTmF0elVFQnI3?=
 =?utf-8?B?cVpSOVJBVytaU0ViRzBRUkxHU0JqbHg1QlMrVlAzcnRlM0tGd2t3NzIvd01P?=
 =?utf-8?B?RUUvdnJjNjVZZG5veUx6blRNQ0N4L2JKYnhIUFNYbU0yQk5LaHgwaXBhVGU0?=
 =?utf-8?B?WnpMaXoyYnMxNC9rZXlnZXpZenNqZWxzSktwWG9ZSnRBV2tMNC9MYm9FSmpw?=
 =?utf-8?B?YU42aVJyQ1pYZmhubExYeGZlV0VHU1p4QWpsWHNPYXc5MVV5VFd6UjNMMlcx?=
 =?utf-8?B?dTV6blI1QUp3S3d0cTRLbTlqMjBBd0hISWUrMDFqSEk5a2YzaUc2bllTUHM1?=
 =?utf-8?B?dXExdXltcVFSSlZoOVZ4Z0svQTh1dTdlWlA2NWNpelFHU3QrenBPZndjTnRY?=
 =?utf-8?B?UnJxc3hGMU9zUmtvOTU1cXFKU0M2QmNBNmFsMTd6MFVodnVyYUhNaTBwYkJU?=
 =?utf-8?B?ZXEvM3ZoRDkvT3hhZllqdFFaSmVPL2ZwSmJRUXpsYm1xd0gvdnMzTlFjcElo?=
 =?utf-8?B?WUxKMzhjQVdXd3o5TUJ2UWlqWnRKQlk3NHg5SlVwOUVxempRL0N2VmZOOERa?=
 =?utf-8?B?R0hXNEZlM3N3V0dibkhjVW9wUWNtMHJlNnpMWHJPY29mYllNRW9iWnpoRm1O?=
 =?utf-8?B?MDR4ZzhWME1KNXI4Nm9VWUplbU5jY0RLeWpiRStCS21GT3UvRWE2alpLdWZS?=
 =?utf-8?B?aC9DbEdiYzdKMVdFaXBhOTlEcUJUTzZxMGdaSm0rMzRTN3V4UFZKKy9qb2Ns?=
 =?utf-8?Q?fkNw04MsB3kzg4ieEQUiBhyh0bycXFKl4qBhL1pyux4d3?=
X-MS-Exchange-AntiSpam-MessageData-1: JeJ8NOnLlimlhg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaec9d9-83b9-4e1d-6332-08de5e675f47
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:18:40.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHQGu+T9Bor6fyzyn1hE/b1NywywOVQb95PUV5FXfHN/arpxM8lBOQeKNn8li8Q317i5LNVPpFnHSY7xcR3C8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9762

On Tue Jan 27, 2026 at 3:30 AM JST, Gary Guo wrote:
> On Fri Jan 23, 2026 at 12:12 PM GMT, Eliot Courtney wrote:
>> The current code indexes into `after_rx` using `tx` which is an index
>> for the whole buffer, not the split buffer `after_rx`.
>>
>> Also add more rigorous no-panic proofs.
>>
>> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue binding=
s and handling")
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index aa8758fc7723..c26396fda29c 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -1,7 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> =20
>>  use core::{
>> -    cmp,
>>      mem,
>>      sync::atomic::{
>>          fence,
>> @@ -267,10 +266,20 @@ fn new(dev: &device::Device<device::Bound>) -> Res=
ult<Self> {
>>          // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_=
NUM_PAGES`.
>>          let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(r=
x);
>
> This code doesn't need splitting as it doesn't have the uniqueness issue =
that
> mutable references have. While you're at it, probably it's chance to simp=
lify
> the code.
>
>> =20
>> -        match tx.cmp(&rx) {
>> -            cmp::Ordering::Equal =3D> (&after_rx[0..0], &after_rx[0..0]=
),
>> -            cmp::Ordering::Greater =3D> (&after_rx[..tx], &before_rx[0.=
.0]),
>> -            cmp::Ordering::Less =3D> (after_rx, &before_rx[..tx]),
>> +        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ=
_NUM_PAGES, inclusive,
>> +        // belongs to the driver for reading.
>> +        if rx <=3D tx {
>> +            // The area is contiguous.
>> +            // PANIC:
>> +            // - The index `tx - rx` is non-negative because `rx <=3D t=
x` in this branch.
>> +            // - The index does not exceed `after_rx.len()` (which is `=
MSGQ_NUM_PAGES - rx`)
>> +            //   because `tx < MSGQ_NUM_PAGES` by the `gsp_write_ptr` i=
nvariant.
>> +            (&after_rx[..(tx - rx)], &after_rx[0..0])
>
> This can be just `(&data[rx..tx], &[])` without the split.
>
>> +        } else {
>> +            // The area is discontiguous.
>> +            // PANIC: `tx` does not exceed `before_rx.len()` (which equ=
als `rx`) because
>> +            //   `tx < rx` in this branch.
>> +            (after_rx, &before_rx[..tx])
>
> This can be just `(&data[rx..], &data[..tx])` without the split.

Indeed, this is arguably easier to understand.
