Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7627603A;
	Tue, 27 Jan 2026 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769547790; cv=fail; b=dwsOv4ioQg1w2bwTl5YiZr3GC04dSdU3H2RN5yAcpe30P/lYUGIlTu0jwLwyveEt184LRYV1aDtpRR3FAfDD71ZB7D7DM2Rndde01ct4y1YdXONcY2Kjsll+OBpQw9TxniiDVsQ9i9UtwNwDE44AnvgBY7qqVucdo9ZTF9bWHeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769547790; c=relaxed/simple;
	bh=NWT3r7ztUJ+v9kqHUyI1AIrHl+WBTkd+Gg7J5nK8m6E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbCUqnxJEU/E3f9ndTnjtigMbv001xKyla09J5hZ4M1wcbRVLOyKPxLrlUSkKQ7z5L2i7r44kyr8ab8d8LL34vo+dLEKADCuil3I2I21gegaBaw6/pEt687ylDU5dwKNJ1Ifsy2qVUeXZkGy7n23k/G5IIK9ILNhIhIVxTaBJpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L7FmUy1w; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7FmUy1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUjcP49EO2Ztb+R+hl0aM4OAo81qqz5Gd2emsx1j+rKXgnlgLjCKg1iFO4B0taLBSJtF0W6y1rvnXQ7ZUrHrRmHNC37sr2Tr7KpLv8w0XxxwQAruqP+OBZpLH3kt8QHKpAV+eZh5Z/gjJOo3gn3z/7bKtdBlzeCFIZOjlw5pDJEcxECzApJfuWQzpzvpd3IKvSlpTsWGHZbCm26qM+gA4DjEQUqldR/tUYG9f/WLJv45WMlX2irwJ7YH5/YaB/JMYQ92SxxsbXU7xetnYe3O4gq6G6nqcx9YJHSBQtupHPwW0nEkd04QYRN6QJs7GUcT2KeRUtL9ZxksOJiyntkD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqx7ThTsZDgCXRbuMg4LfdAQ+fhsLACEE5QU7mjZ0uE=;
 b=cNPs4F/TnltJ7x4GO5pYOl7WmPzNn2fSiFZwATjRpWjpyE7jE96CIlhlkTI9OF2ycSiValLlNDUZFR8uOhAk+EyQqgs4U2Us5mzmtXChz8JcS5z13Q5JOMg77yAzTMj6Us7wf3aAwJTu3zRqnP0qRC/NesY0ODrVHQ1BSegBB/okcIrrfN/PjUc/gUedEx9OAgELcrnpc2VoIRZwENNpnoxs49At+cyj+OOTGorkCktBjMAdhce0Z8gDBrSE/24eULNzqmPcm3CngPn2HOxAu2soVHx2G3xgQA4ZNgDOORHQAtBl40f1leD35IZKOfbAY1XhNBKLRJZpMb4gxB44wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqx7ThTsZDgCXRbuMg4LfdAQ+fhsLACEE5QU7mjZ0uE=;
 b=L7FmUy1wYy1tGIqpqXeHvUDvGHkIlPO4iYtD6g846Hy4jFPIQEm9B0HjzM62Kh5uRvA9OhelwTd5JOvZcgHR+8N+I94GTeyq3+DmjOOM2vvjFiHn8AMTRgJlsCQtxrGFgqlIG+2s/OvcIwXHFukfmGgtG/WVx4tnEnjHJYGqlWoq6Sp0Ni3VOKvIVjo2fJDX4i5lCYOHtsef8Ch2nfl7dRGSIdVQRf2XvDSN8uQyZAHisaX1zyDGthRNjlAOm8nYop28RJRub8ehVF2X9H02UBzskdffLi1TgXf9KuHXaGBQVViwT46bGuiwaxjRXJ5wE8M4fxWZpylUd/VuKjBzRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Tue, 27 Jan 2026 21:03:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:03:04 +0000
Message-ID: <2c3ddf4f-3085-4447-ab2b-1976ea0a49a2@nvidia.com>
Date: Tue, 27 Jan 2026 13:03:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com> <aXgpKOHAmvZuMVSt@yury>
 <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a79677b-71fe-47eb-9665-08de5de7765b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3dEWVlXZ3V3WFBYYXRQaUsyTUt3bkNRVTFlZml6UTlWUlpOS2s4NXJEd0hT?=
 =?utf-8?B?UDgxSGxrQTRwdkFNMzVHNWduYi8vYmt6VjViV1JFbUoxdUVNNXRmbHpDRkdO?=
 =?utf-8?B?SFpaODJqS29KMFI0eTdoME52NHNqaUx0OXIxUVE0YXBqTjcyOHd1dlliVzBi?=
 =?utf-8?B?Z3JrOUlrWjQrNXNpbWprc1M1NGovd0Jnbk5HSEc4NEVhVVBDRmQ2OTFyTGVi?=
 =?utf-8?B?N0Uyalo1L1cvMjNzaFFwT0RJMUNIYWhpNHVsQ3Fuc0hTWlFLSU9kVGNOUEsz?=
 =?utf-8?B?aDVRN29HL25vNDJNZ3lqdW0yc2Q0OE5kOUJPWDVqMzdOaWx1NEhyL2crQ0k2?=
 =?utf-8?B?K2NRajg3NmkxSlUrbGdLdkRxZ2tVbkt4cXZ1Z3ZpV25yc2ZQM29UNFlkaEFv?=
 =?utf-8?B?M01lTjVadnpzbU5Cb3N0a3NlbGtzWm54S1pFRHFlQ1dCV2NvT3pHKzFsTG95?=
 =?utf-8?B?b3Yvd2lOU2thbXJRSjBKOG1ybXppWG1FaW5ubWJoY1UrYVZ0MkhCcW1hOFMv?=
 =?utf-8?B?MEsxOEtUNkt5d2xveHpFcHFQM0R6RXJUd2tUQ1BueDdZNnlINEJCS1FHaDRZ?=
 =?utf-8?B?VlBwZmx1YWJWY1FweHA2bk4wTUE5SndSTG5CK093VDgxRjAzNWQvZ1NtWnM5?=
 =?utf-8?B?NXdRZ3BraWZJZWpTanNuMHQyVDh0TEcvMFYwajJXMi8vTE9CTnBtRktlWlZN?=
 =?utf-8?B?b2ZmNm1tWUU4OWtTKzFENTNwODhIYVdwNnhTZENOTlBDMzhZNm5KbUlTZktT?=
 =?utf-8?B?aElzWFBiL2VmRkM4VzRFUkN2RnV3YytrcnJOS2ZPS2dBOGYxVEJ3czN3eDU5?=
 =?utf-8?B?YnRzaGdIT2NDdXkvR1o3VzJNVytKclBlaW53NUhmbkxsQ2J4ZEVzZ1p2ZEZ1?=
 =?utf-8?B?VG5MNTUvNjhEQytPRmhSZ1BZZGk5Vll1bVhiV2MxWTEwcDF5SS9TclhFMk9W?=
 =?utf-8?B?UDNxOXNsUXF6L0dlV2RpWSt0SWQyc3VCd1l4eWg2Mkc3M3ViVm1vTExWNWI0?=
 =?utf-8?B?VGYxd05oanMyaDhFU2NOUFRXamIza3VQUGVmc0o5VTFkVWdEYkN1WWxrcUFV?=
 =?utf-8?B?WGsxT3pNcTZMWXZsNFNKd1hTaVpBV3VUNWVPTFRENE9oUGRCTUI3Y0RvSW1j?=
 =?utf-8?B?a1RTdnVLT2NJNjVnYjRLOUpiamJ5VWU1aTBKTnJnTUN6MW1xSkhLL0ZnZmtN?=
 =?utf-8?B?WWdQN2tUSC9EQmJhQi9yVGRrOE8ydkg3NCtXMndNL1M3VGVRWitoOVdWZTdY?=
 =?utf-8?B?Y3Blc0x0NGhwQ3JWYUg3bExIb2RDYXZIQllzZlVwNEIzMEY3V3RwYkhPMnRi?=
 =?utf-8?B?MDQxcjJGN3ZNeko2TVhQNGxpR1kySkdmd3lBaDdTY0Z5VVdwZ1ZmMHAvMlli?=
 =?utf-8?B?N2VzbFdQT3VIVWxOL0ZUdFEwcjZheGZVMFVvU0g1cUdpRUp1RmRleFluOVZB?=
 =?utf-8?B?NlJaeDljSm9JK0VEUTMxQW45dGNzVkJsYjFKaCtoUFJzNVN6Y1FEUnFuUzFW?=
 =?utf-8?B?WlltaTJmb1FlOVA1eTYwcGNIcG11QU5qakQ0YU96V1dVbklUcXZZL0xTbjcx?=
 =?utf-8?B?YVU5MFlmMTFiUDVmd2ZxUHpOSUtyZzBTVytUMTdnSFhHb0tHYkRPRzJGVVhM?=
 =?utf-8?B?dDFhNjJoUDVKNzE5WGZVQzc0VU9LdkgrUTBONkpZMG85U0RxOGltU0sxeURj?=
 =?utf-8?B?RHg5QWxFQUE2cyttYzZaeUt6UVM2SnhpTkk4RWtmaFhMdW1XVHFIbWk2NXRL?=
 =?utf-8?B?Z1JiZkhraTJuKzVyWUVwMmNiQmlFK0w2T3RnQWhmZ0Z5YTR3R0FuRGRNZGF1?=
 =?utf-8?B?R2dDY1d6VHUwR0xuVXRoUU41Qkp1NUxwUzZLeEFROTM1VWE0VFcvUXJXNVUr?=
 =?utf-8?B?MWRiNEp3dGoyQjNjZk1FNUoxdkN5SkJBK2FhSVVBeVRENndMUE1QcnI5OXBy?=
 =?utf-8?B?TWZVVjZjSjNHcWRmbVF2S2U4U0VRY0tXaGkydmxGQXA3VzdkdHROV1phY05E?=
 =?utf-8?B?NVB5Qzl6UjVJOXh2RUs5cDY4em9SaXY5YnZ4bXlCNEppenhnOEdnanB5RTNR?=
 =?utf-8?B?TjB1cVNxT043THliMnhOeDBtVnYybFh2WFB4YWNkcmwwbVNKTE55K0Z3MXRh?=
 =?utf-8?Q?5zIM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWgzc1JjZWpJQXFsQUxwcDR1cFQvd1VvZzdPQW41c2RiSkFEcXFPcE5WM2Jh?=
 =?utf-8?B?RFVYWXFXMjlsV3RBMExDcWtrZDFRdm05Y0xkSHZwbDdJUzlsTTRkaGFvVVlq?=
 =?utf-8?B?dk94aE9ESUM3bDI1ZEgvZWtuYjNOVXIwRTJkdUx5NlpVVGdXcE0zZ3ZITzNH?=
 =?utf-8?B?TE4xMTNRbGt6R2drNWk2RytZZTQzZWszZ2VVZmtvVWxicVdPcUM4dDBuaXNy?=
 =?utf-8?B?M1ZJYXZTdlQyTGl5cUdlQjIvc3hOdGkwTUZNbzRuUStyNWNkblJHWUVhY0RR?=
 =?utf-8?B?L3lWWjR2elN3ZzFuMVMzUWFhZ1piK2VyWUNua2pJOGxCTzNuajV5by82L0t0?=
 =?utf-8?B?Z0gvVzlJTWxJMXN1Zi83OE94Yk5nZCtRRm5sSWdQRG1mN2hPMHdHMU10ZWNJ?=
 =?utf-8?B?UEw5cFY5ditiN0Y0NDA2b0h4MlA4SjNNdk9GaTZWMHZvb2Fqb2xiUVNOdnM1?=
 =?utf-8?B?ZW01dDduZ3pjL2hIMnB0bGUvTUwzQS92aHlMQUpZMitGUmhRYjB5eUVpdC9Q?=
 =?utf-8?B?SnU4ckI0RGdyeVlBSVcwTm83MEs4b1p5M1hMM1JIN3FmMktRU1VZYnQ2V1pG?=
 =?utf-8?B?aSt6N3Zpb040UjF5OXUwQ3kxNGYwR1F1b3hXRXZjS3h2YnlaVkE5Tmo1UjZr?=
 =?utf-8?B?Uk1DS0RkSEd3SS8raERvc3prSE5hdUxRbmFWZ0hKZEVNV0w1bVFBOE52OUIr?=
 =?utf-8?B?ZGxvazRuWlc1akpRM1dNU3QzN1JoUDdSb2x3Ny9hYU56cHdLWXF2NzArTlNG?=
 =?utf-8?B?OTZzWDVwUzIyeDVIdk94UUtZMFMrUHpORVZmMmFGUzFFMThIV1h4S3FJQU1s?=
 =?utf-8?B?M1VHM2g4eDdPWTFlSjBDMFU5QWNxZFZSRU1TM3BCOWlIam5xamthc25DK09I?=
 =?utf-8?B?dVFkUWNiVHdDZzNPZ1kxS3ZUNndmcy85ZFN2aDc3YzNteHlycjZobXc4TGhC?=
 =?utf-8?B?dEdHekZxeVJqd2diMWxvTEF3WDd1NkhNYU5xem5sQlAvQ0ZyQ1IrbGR6ZWRF?=
 =?utf-8?B?ZWlUdjUweVNGWjMrYUdUQ0VFZ3BXOGx0b1RxaHZ3RGVoR0NPNW1XNC84SStV?=
 =?utf-8?B?Q1lMQjRJRGNVY0NPbEtBYis1d2xRVU9CcVRnYXhzTmF5OW1xMUVFdkNmcUVX?=
 =?utf-8?B?d0hkNWordVRPa0lGR2N1V0FUcXhGM3lrenpFTjN0aW1UZ0IwbFdCbXNKbWh1?=
 =?utf-8?B?R002cWxFSFlmQnhTMno4bG5qblc5enBJU1QwN2kzTGFBalY4QmZ0VGZNdzBY?=
 =?utf-8?B?MlZXY0g3TVZOT2hpVW4vUitWZDJjbm05dm4zNUd3OHFCcndQUitPa2JsRlJX?=
 =?utf-8?B?MURQeUVkTFp1ZFFUd2NSWm90U3FJci9pNFdMV0I5eW8wQWVHWjEvRkRKOW5V?=
 =?utf-8?B?bW4rZitSMmtBb2NTS3p3Y3p1aUhqQXFFbVlrd2NYZC9VWkxwRHFXUTI5cWFt?=
 =?utf-8?B?ZXZxNUNEM0NpTHFUSytneWFlOHR0MVNUUmlUdDFRV0Uwem9qS0tGRXVGOWNt?=
 =?utf-8?B?MTR0Q1c2dHZMWEhpenZaWjJjdDJrVXZLbG00LzFBL3dJQ0lIUjkvY29yeE52?=
 =?utf-8?B?ZjVsUTU0RzJrTjY0alZ4TWt6aWVGemcza0R0SkJiWStyODFiRkttNVk1Ym1a?=
 =?utf-8?B?bHQ0YWdJanErT3QyRHQrTzUyNlp0NDI4RHp2c1hVY211eWtNYzZYNm1ya2lI?=
 =?utf-8?B?UVdRZERDR1BiMjNYYzc0R1FYaXYrMi90enN2a3ZNSnl3aFdJT2ZScWlZQzRS?=
 =?utf-8?B?bjZhMmdzb3NYbjlUdTV6Qm5RK0lBS3p5YnRyMzJidVlGZXJVdjNjdU80WDhn?=
 =?utf-8?B?bDlPUFl5Q1M1alU3L2NzSFduM0ZkcDQ4OEcvU05uenpXQlZENXU2eHJWc0Ux?=
 =?utf-8?B?M2xVRWo4d3NsMnc2YnBOcEtxb1NnOHM2WUQ0OUxkdnB5MlJTUTQvUEo2ZGpm?=
 =?utf-8?B?cFBiZ1IyK09maHFhZXZpR0N4UFc4SmdWZWhCTHhyU1JwWEd3blREdkhxTWtO?=
 =?utf-8?B?SVd4YVRhOXZZZ1d2M0VlWWRMQUQwUnJwZmpGQk9ocFNES0dPTWVPdWhhUkth?=
 =?utf-8?B?QU5XL2oxNnd4L0tKZ3NJZWZhM1dFTGcrYWpqVyttbVlXeURNenFvdWZKdk0y?=
 =?utf-8?B?aDQxQ0d5bE94VE5Qa3dSbk8yN2UwMkZSWkU5RXJCbm9XODVESHVkNmpvdDdE?=
 =?utf-8?B?eUNqK2JBWml1UnpVSlhBVmRpK1NTM0pNRDNCNTZYbVU1bWtFQ1VwbHNoOXhY?=
 =?utf-8?B?WjF4VWI4QzRCcE1kTDR5R1JOL0l6ZnNta0gyclRUbzF0b0JYUENsOFM2S09y?=
 =?utf-8?B?d1VjSWQ5NW43bkcyRXZwWjlGdjZQb21vWTFpaUNpUDQ4QzJqRjUzUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a79677b-71fe-47eb-9665-08de5de7765b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:03:03.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewrowb0m68nfxJ8poQ2Ed1UAevfSJT2BwQgAOsPgNdU75+nxMdkLcxUXmzhZKChpMM0zsS9BoGr3deOb6hdAIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912

On 1/27/26 1:57 AM, Alexandre Courbot wrote:
> On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
> <snip>
> 
> So while we cannot achieve exactly the short syntax above (which has its
> drawbacks as well, such as the inability to operate in const context),
> we can introduce a new setter than works with a const argument and
> spares us the need to invoke `Bounded::new` ourselves:
> 
>      let color = Rgb::default().
>              .with_red::<0x10>()
>              .with_green::<0x1f>()
>              .with_blue::<0x18>()

Are we sure that .with_red is a better name than, say, .set_red()?

"with" is not so easy to remember, because it is a bit
surprising and different, for setting a value.

"with" feels like a function call or closure: "sort with
qsort", for example. But here we are setting a color
component.

thanks,
John Hubbard

