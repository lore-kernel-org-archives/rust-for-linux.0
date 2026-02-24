Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEEB640;
	Tue, 24 Feb 2026 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771900275; cv=fail; b=dSOKFCV5lY//7OOfJwK52u3EZ2mKDiFMRFjnvnAdNxteLYjGbUp6B8pyIoLcPtKhp6hIGl5KWa42GYF46LlJa5QPWYMgcBCv0x7hnnCdoqS5pdhdVM4H2YVd3NoEPmftMUIXlzUN7EEnRssXoHMuAx4GGiMXUlW07UO9fzXsLrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771900275; c=relaxed/simple;
	bh=eB0OV3TYHvdD8Z2b30x5oFx7NRxC5vCLUQ7gtjxf6IA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WC9a7eSat309scTZD53FfgU0FQ5IMjDdpFvljpWScA/uZHV0sDTIE73BH+fEgVGUGevEBxb3ByBichXG2k+Az7u2tK3b6YFhcTerAVS2IX8tDs9qbH61FI0GTyJv598YIwUVB7YxVIQTncfsxLvDU4CE+bz05eCQ+UFSk83WP3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=njKPqnuH; arc=fail smtp.client-ip=52.101.43.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="njKPqnuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVzz8uEJjKv86zJsrsx2pJoy0fR+ZsVIt85WAocLOvUG2BIcgkpZ22Z1c5A6Ce69qp8oidyUicSiMZpF0s23+G7o5E3g+nHq7r+KqXDJlZCu8JoIAsLiOXfH4fHPS5kdGsuH5x+0QfTnROEzUrAu3k1GTXgzefbr5F+v9p0K5efbtqetWMjIz1NTN8bWkd4S3EP786pGu0tOGB3C/z7EDyC0mYEP/6w2ml7zIJgYnMLi1WGUBHwzL3ZhA5XJmHqUvKdd8zKRusOV0zSjoe2V9qmo1bfakfDhtq6G9y2hyRzVOeW1re/KhfT1ebNM/tDVax1GQMo823RFm4IUPFzfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6VoiwYIkeFcsX5tkL9NovAHx7E9aI0BiEs762ivMjw=;
 b=o5Z6CI6blh2Wa1Lw9TR8Pdbrg8NZJg7ydvdgofeLqiq6656anncdwz9RqGklP9K09zTd4VjqcTAwPW36HX3r9m5VkKBqSz/LyeKKmf+5OIyuiVcAlv8IvNRlWflDcq7hHqbXZQIMOpgmezsyaRo4HxU+syxryawXv/Izri8jdaa7Zk34QNOc491/t8SywYAQB19vZrE9vXWQAeKu1IsJAs3PCg6yXWWY2uYIkS177NAR6NtGt9gwP1zacMxfa0X3FJRO/pCKdM1Fo32A5igZQHWyPf6SPRWhrnaOa6wfdXduzuRh7rGLKry0Qn1LLWuYf5EN3ZPXqNRCEY8zybvnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6VoiwYIkeFcsX5tkL9NovAHx7E9aI0BiEs762ivMjw=;
 b=njKPqnuH+lsXG/m4bBifQnt4r1gqdiZCBUxctJsUHlPpj5EyF2t7CF2risuMuf3aASMOkxQp0eFt0uT3/A5xPqMqrEQtLTRM1njXqMBDeASYYoLqAVBAPUoCt+1HRv/cWlPxIg9TNV+qXshm7h0zuwzTtJGsKjO2XUwilq+aiEpNQ9ysfg5QVFdQK6OWif1o2t9ZGHP6A33dL7ge6smSs+hDGoWVHTTuFy6asAJt+dBXLgzzPdINzqHajfjocNLEd0NxzRWznKuTMhh5f8Xr/kaPMjAZC4WWF1NXdzTAb3PbZpDUvjHppUp3VHPUSrqCHPu9X7Dv/WQOitXxXSB+rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:31:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:31:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 11:31:05 +0900
Message-Id: <DGMU80KDI2NP.14EXST8YEO2YU@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 9/9] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-9-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-9-238520ad8799@nvidia.com>
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: cea0e1e7-3198-40f7-8e1a-08de734cc4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGlKNUhYRWwwaUVTS2dKMS9DZDJSM3A0aU0xUkpwYVRpTzBJSHAyWFpmUkcx?=
 =?utf-8?B?aHo5VTBSa0RHS3piWDNsU3RlSE8wTi85ZGgxMjB5bTdJZnZqYlVxZm1INkhP?=
 =?utf-8?B?UDh0UC9aYjFNVHgraUVyaHRQMmpxUThuRzFKUGlCV3l1SDJnSFh4ZFNzRU5a?=
 =?utf-8?B?UW1Sa0VMZ3V1Wm1KdXZNVmxnRTJMbjNMckVHcktnamR6eUhWUkphdW1aVkdX?=
 =?utf-8?B?UWJHQlFtZlhBOHZsMEJOVWZ3OE01S3V0TE84ZllQV1FjNnFLdUhFaGdOcW1s?=
 =?utf-8?B?WTRmSUIweTFxRjRYZFFXVWpVc3pmb3pqVWs2dy82aWRSc3p4eVJtMWFRZWp0?=
 =?utf-8?B?Z251YjNHREYzNURqYTNmR2kwQnIyUW9oWk5tWlNXakF6OWwwSGdIaWd6L1pD?=
 =?utf-8?B?VlRzcEFpMVIzalcvenNJbEI1RkFnVVZTazVJMzlOd0o0VHRZZXlNdG50aGpJ?=
 =?utf-8?B?aUxkVy9yOS9pRjJLUjYyc25NK0o1c1lXVWUweTBoOWtnT0h0OHNmTk9FTlpq?=
 =?utf-8?B?NUNlaHNacjVkS3IveW1xZFgvaG9OU0NQZkRnQnk0d3lJaEdJWGl3RFhBYVlW?=
 =?utf-8?B?U0g2TndJREJuQjZ2Q3FQUGpNNWZsNHA3VXB0SGZERVBGSjV2bzRzUnhVRnYv?=
 =?utf-8?B?b0tzeHZjMENYV0pwc0tzSTlxSzhNQis2SERWdnd1Y1pXOTRZTUtGdGcwWGlv?=
 =?utf-8?B?STB4TWltRFM5QzdPT1pvcktLVXd4Qk51bi80VVE1YUptanl3emM4YTZiNUU5?=
 =?utf-8?B?VFU0SUNWT0czNnc3YzBZSjEvc2toRTlDVDI2OUdhSnM1UHBoMEMvamsrVGVC?=
 =?utf-8?B?R3drMnFCcU85YkhxRVM1ak9md3pBL01KY2hCcjd0SG1ldUJsTjFINk9Mcnpn?=
 =?utf-8?B?S3lOZ0hRdDZhMXdpckNZUWJqKzZhYjQ0YVI2bGx6NFVPWElLWWgrUzEvejBE?=
 =?utf-8?B?eWNqdUdKNUE0M2pkU1FxdU5yZmREZTlxZFNPdGVBMk9NSkQyaWFaUWIwZE0y?=
 =?utf-8?B?RXZySUR5VnNEczU5Z3ZrR3FhOXJ4L3NXZEpicW02ZnlOczlnRDFkTmF4RVpq?=
 =?utf-8?B?c1lkMmVwbmMzcU1IaGxyWHFwVzNrS0pQWWtwc0RUcytFL1ZTVUwwQVVRTml6?=
 =?utf-8?B?NjJSakxJaWFpVWU0V2dBOSt0elQvWE1tS2VSNGx1NTMzdnB1Q2VPclZqd1Zx?=
 =?utf-8?B?SDNMcm5BUUp5d3UzL0REUW1iMldicEt6WFR1endxa0YrU2I2M21ld3plZUdO?=
 =?utf-8?B?WFU5em5LOWZJbVRaMm9obFhodThnNWxHSExMdnRFWFJTUWJrd2k1aW10VUZv?=
 =?utf-8?B?MmJ3MHFLZUdiQVJ2Q3lIZmZQNVQ5SzVTSitscmJwMTdib1JQeWJBSEI1VmJX?=
 =?utf-8?B?OFI2VUdDUUsvR251RkxQd2RZTnNjVTh0Yms1aW5xSFppWEJCRWdLV09MRTFp?=
 =?utf-8?B?eFlSa0pYbGgycTJnMnJIc2k2ZnpaZUNTQmFpQjQ4b1g5ODlIYWlKNTVqZ2g5?=
 =?utf-8?B?cW5PeG1FL2dkdm54UGdleTUwRHpEM29QYXNzTHlnKytHdFdlcmtUSzVHbWZx?=
 =?utf-8?B?WnI2L3RSaUlBY1MzMEtXSXFsWFhXdFNmQUFXSDdERDJMR29HSENqczU2dGNt?=
 =?utf-8?B?TGFEUk5OVmlUT2VEa0FYNUhyNjduR1RrdUtMSENqTHM5a1EzZjEvNkl6OFcv?=
 =?utf-8?B?V29RMjJPUDIvUjQ0bjNFd0dHUWFDM1JuMXk1Y2hFSHAyUkNEeGovdHdmc05k?=
 =?utf-8?B?S3pXb1QwMnBTQ09yYmpPeC9tcHBSRmRNaEFuTnlIS1YzYmlZZFprcmlpaEhx?=
 =?utf-8?B?M3k4OS9jUXFTemNTUW1mcW5DbWdZTmJaYTAvZjVMMkpVMDJDcWE3c1FobjQv?=
 =?utf-8?B?R0ZZaUZIYjBrYjdUZTk3QnFRc25mbDI5YW9IRjRpVm13TnpoR2dJSFNMSWQx?=
 =?utf-8?B?bnczRk1wd0c5WVA4T3Uvc21lU3k5eDFPR2xlUldkN0RycXN6OElpZEdESkZl?=
 =?utf-8?B?MVFLSmF2ZHBlZVVJT1VFTkNsQXBzZjZQUW9ocks4TEU5U1RML3hVSVQ5UHAr?=
 =?utf-8?B?MEVieUVyeG1ubFA0MEdwZEVUQnJzRk5zUHZHbnZSVExwVmtnTnZUNHE3TlNs?=
 =?utf-8?Q?pZFU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWpYcFlTZmtrSS9JSUdOOS9CQXFmOE1xdTFRNkRCbFdHbGhORDd2YVVuSkNV?=
 =?utf-8?B?YmN1VENDZUVUVzVJbkFydVp0RHJuSlFkN0IxNEN6Mi9yTjV2cGRZaXZPUWg2?=
 =?utf-8?B?aXlMckJ3V1c5QUJwVDlJSU9nTG1Nb1VQbWlHUWlhOG83bGdrSTQ1N3VvRzJx?=
 =?utf-8?B?dld0MEFaNGZ6b1hQOXcyci9YZ2RGdUYwd1ZySlBrL1JORUdWRW9HY09ZSVUw?=
 =?utf-8?B?Q0FPZlYwdDZYcXQxb1ZLclQwVURRanovRlpnLzhHb0EvbmJ4a09UWlIwYUxl?=
 =?utf-8?B?WmYyOEhhQXNNaG53dUNJdzBsVVhuVG1MUDZaa0pDTHNDL0lQMExMZENqWXl2?=
 =?utf-8?B?c0kzOVY5NUtWdTE2bWIyY3loRmZXOXM2enE3VHNOM2lIOUJCbVJyMVdFb3lt?=
 =?utf-8?B?QXJrQ1d5NTJPR2huSFhveTlTRW91ZUpLQ0ZRb3JmaHBRN2wwSDM5eG9DbDAw?=
 =?utf-8?B?eXAvRW0xY2ZzcG9EU2Z6d29tVlJ6c29DaHJkZjBrT0UyZmVEVnpPb1YwV1ZR?=
 =?utf-8?B?Qy8yd05JZ0psMG1TR2toUWc5NHYrcmVLS29nYTlJSHc1QWtsMVpRd3dYN2JF?=
 =?utf-8?B?ZzNuUW5aZW9nemtpT2ZBRERhUnV0YjhrSVRrYlI0WmdmNHFiUVpEaE9kNmha?=
 =?utf-8?B?emZIWWN4eGFkUUVTWHBNbS9hNlh3bi83UmZXQy9VNlVyYlBXWUl5KzdQdm9u?=
 =?utf-8?B?TEcvSFhYSkNQcVlTNXJMR3Vmd2pkUklQTFRGb3ppdUlSaXV5NmMzQUVYcmJa?=
 =?utf-8?B?UVkrMlovdzBaTmNlMVQ1YzRMdVlGOUU1SkFZakpCYlZJU3NlVlNnYlJIT3Qr?=
 =?utf-8?B?NjFoanIwcUx0L2o4OGlDQXJyc0Rhb3RORmp0OE45QVh1bjAydTdFS0dGcnE0?=
 =?utf-8?B?VWRKT1N5WEM1R2tRUE1lOHVUcFB5OE1KM2xjKzY5SDN0L1dlQkVNSTA3Wmxp?=
 =?utf-8?B?WGFwa0ozYkZSUVpZSXRBVWUyY0tyY2hOeUhvbUFYeFppNlpWUDRicVh6Z2dQ?=
 =?utf-8?B?N3lWWG5JUGFlWk4ya3ZzOGpuVFBTQTBWRHBUUVljUjM2RWdEV2ZrTWVHSy80?=
 =?utf-8?B?WjRRejcyWTUwdXl0TE8vMWpDRU45VGVTVThSTjJwbkFmZlIwNytoVmNQRGVV?=
 =?utf-8?B?ajRSMWNqQzFPN241MCtMaS9EUlpYRW5Kc3BmVEhKV2pwaFBuVWRjVjRsd2oy?=
 =?utf-8?B?ZVVMcWk5bkdQV2FzZk92eTZIaXF6U0ZUanIrckNoZEJjTDFESUFRYTBYTWZZ?=
 =?utf-8?B?WG1KejJsOEVMSTY3N0hXb2NIR2prN05kWmZYNmpOeDJMaERWQ0kzcktBQ3ls?=
 =?utf-8?B?Y2dtaVMwekhVa0RVWnRTenIxcWNoL2R3TVZCZ1hvMVRvRTRWRXZoLzFzUEww?=
 =?utf-8?B?d2JUQ2dSdGhJWEpuaVNIaXZRdGQzUjhNOVh0Y0ZOa0FpWWt0U1lPclVLZkVh?=
 =?utf-8?B?TVFBZnpwMnBCeE5KK2ZqRnZQR2xoYTBxTXZFbUhndWQzcTh6WFJUVW1JZDc1?=
 =?utf-8?B?a3Vtai9GejA2TUxQcVFmZGw0emJkK0FWWk9RdHNjaG1WVjQzVi9YZCtWL0dw?=
 =?utf-8?B?QzdRd1l5WFBmSXpLcnJVNTN2c0Q1ZVNnTWRCZnBZMUUxZXRaY0NVMTBGdWNZ?=
 =?utf-8?B?NGJ6cU5nTG1KNXU0RnVJdko2aTdWU3ZEbW5kRXBwZkJQTm5oYTFMVktzYkJi?=
 =?utf-8?B?R2Vlc2RTUW5ZaytJVHBRbGx3dnc4U1Q4VHRYdWUzNzVYVXdqVTNpUDZMa1ZU?=
 =?utf-8?B?WGZpUjMzL2ZyMkhHVW43NkU1SzlCMmtEVU1KamNyWDQxMU5HVzJGQWxhbHZw?=
 =?utf-8?B?Z3RmRXBLZ29yZktTM0JXUE1yTGV6UTJpOXhIUTZJa0JrTGpGSXFza2NDUUU0?=
 =?utf-8?B?eXB5a0VidDF2MDlPL2crbFAxSlhZbGlxcFR4VDF3aUYxbnFyY0lEZEszeDUx?=
 =?utf-8?B?RDBjc3lHTnB5WU96Zm1mcnpiT0dzNVN3QjlQcWFEUG5VUm82blM0WE9vU21H?=
 =?utf-8?B?allaWW44clhsUEtiTCsxaEtUSUpNVkg3YWdZSVJ0cUk1VVBmVXAyd3hpMVd6?=
 =?utf-8?B?dDRIZ1NJMkFlVDBMRkNIWHB0emptOFNRbXFEYUREamhIaWR1NHpZQVBSVzY5?=
 =?utf-8?B?dGtpb1NkcldBdXNPMzFlVlV1S09lUjZhcTBLbTNFK0VhZDlwQVFhaC9IZHBh?=
 =?utf-8?B?NHl0RGRreDE5TUM4MDIyUHFxWDFkNGhuejBJSGtUNGY4ekM0UmpLcjZHZ2RQ?=
 =?utf-8?B?YTdnaGhYWkdrcDRmeStSR0RjS3JDMjVjcXovQm9mbjc0Y3hzUkt4ano4WGZ3?=
 =?utf-8?B?SDkzMVprbUpGZm9OY09FSXFMTTcwcTJyZ3B3aHc4ZmJXQi95WWhnTUMvbDJX?=
 =?utf-8?Q?oaV1hyUlLz7gdhPzwKdoVXbTuzgdnqOVYmDmZHTvCpFfF?=
X-MS-Exchange-AntiSpam-MessageData-1: RLexR4qFJcPs7g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea0e1e7-3198-40f7-8e1a-08de734cc4b8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:31:09.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfEEC8I3kctVuCzgRkrQMzxMVYQwX7bBPx3ibqgkpnwsvwRLf0Nn2kR92i/KvDL+Ei0q8N4Nef0wA8s1W5XkXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581

On Thu Feb 12, 2026 at 5:26 PM JST, Alexandre Courbot wrote:
> +        let dmem_desc =3D {
> +            let imem_sec =3D FalconDmaLoadable::imem_sec_load_params(&fi=
rmware);
> +            let imem_ns =3D FalconDmaLoadable::imem_ns_load_params(&firm=
ware).ok_or(EINVAL)?;
> +            let dmem =3D FalconDmaLoadable::dmem_load_params(&firmware);
> +
> +            BootloaderDmemDescV2 {
> +                reserved: [0; 4],
> +                signature: [0; 4],
> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
> +                code_dma_base: firmware.dma_handle(),
> +                non_sec_code_off: imem_ns.dst_start,
> +                non_sec_code_size: imem_ns.len,
> +                sec_code_off: imem_sec.dst_start,
> +                sec_code_size: imem_sec.len,
> +                code_entry_point: 0,
> +                data_dma_base: firmware.dma_handle() + u64::from(dmem.sr=
c_start),
> +                data_size: dmem.len,
> +                argc: 0,
> +                argv: 0,
> +            }
> +        };
> +
> +        // The bootloader's code must be loaded in the area right below =
the first 64K of IMEM.
> +        const BOOTLOADER_LOAD_CEILING: u32 =3D num::usize_into_u32::<{ s=
izes::SZ_64K }>();
> +        let imem_dst_start =3D BOOTLOADER_LOAD_CEILING
> +            .checked_sub(desc.code_size)
> +            .ok_or(EOVERFLOW)?;

Are there any alignment requirements for `imem_dst_start`? Or maybe
`code_size` is always such that the alignment will be fine?
