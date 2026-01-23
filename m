Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263E32BF3D;
	Fri, 23 Jan 2026 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769137798; cv=fail; b=IbPZvzT77ufBGcxTenvGyBy+iYMgBJzQeiEvwny6lZkfCjn90/Dn+klYRGdMmAEvFjetpYnNyiBFNad0G3sdaQAcf7en20XQZaZn7eQBSSs9wzLueOYj/oeQYJEj0jkrksKfi3kXRcRJVvhJgPlOpA+ybTFbOu1R/rqtB9nZB1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769137798; c=relaxed/simple;
	bh=3gysNB2n8udQrjkMt3XOC4mjk8V6JRi9SA7iq+8ZGuc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tb/b/FDvp410Q/Yqmei+JrGzhGPzPVCvkG4L6aFaFCMDhs6ZeyL3cVNJHvCQ5MreYqZ+gPSNckF7I/rWi3obk8Ehk0oSX9JJ1jEUkbIzXQM/mvYFp4KwEN1wilbhxu3qZFDTJ8jmOC86NtbWyVkKkNET8voenfFqr63BXXPuero=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZY19ug1A; arc=fail smtp.client-ip=40.107.209.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZY19ug1A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrC5N5GsuWaW3J35ughmlgyN4/x3w55vf2+idhlIUImSZa6zTFhIGXBxwaRt7LGKZZMfKu3wzYdWuYnWzlBgkdX32+v0XaT3TlokwQQHzxks/S0k0seVoIgHHfwAXMbGDti1hXI3cvQranVcn75zOC/1s9jaGTAb3FVv9kTYvzebMzmkdEN2440RR6jWckG/q6k7sPD7Rgy8Fz4jQe0sp2ARKCb1wy0N642s8txoeTEPPcDyzZW/Zm1cBiYsOCi+wbmQOdY2ttdBim0fo5QTqhqxoEA4sqi8ACG6dlc3Puh+63MD4QvHqvqfa5E9Z6VgQA/9ApvEs99BtehHEbFHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3nUpjICE2OVwF5d+Y31XDp2Ey00tYZmf+fJFYdDSiU=;
 b=EVvwBWZaq2FaacOiuLnbghYjJpkkrxU1kvVb3r2mv19b58grgG47MJfmYoba19inAJkOVhFt/7SqJKPSuvVi79sb3MwAWWoVJsP+tK10kZBJiVkfugkMPoQERzZT1laM4uEY5eo5Vus4fHKmhfD3lQpG9ct4+w9JIz36gfSUFGMUVyO/a4J+sst3HMbuSsdFOrTU1NMDPrqXtw5s2obR3SfO6NSApDROo/6fNEW///S3TV8XZZKmxJGg67zAeGw+QWxDa/aNTIMWxhPNDP7v1U+EeJ1t4ba2Gpe0vN79p7LVTm67PYaf8yTunickAFQ4XndufiO4nOi3hiIFlhWcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3nUpjICE2OVwF5d+Y31XDp2Ey00tYZmf+fJFYdDSiU=;
 b=ZY19ug1AY/pw5C/qL1mn2MvbWjJZM4YLsiArjiqlF2kHbFGIUiJcFnk8+BPMCI6uWiSa95Qpy4TAbjqSuxc7bJ5Y0uNFA1XNpZC1Urt+OQ2v9I1r4wT6G2mbTbnIAjXfPGDuV2eTTXOYtgMgT8YLdWyJRxda8RT/HuEX5V4uX9NA1Y5J4K+aAr6I5PalsQOfo4oLydNYXS4Ldz0imPiY4SmEG9mIphGWPehIkpAUt8r/xlC1rnhCHTAawfuYYmLpserU4/Zm3rC/seNB5GlWpCy7pncsTvoRupeX2OeK9NJDyOqb4Wl6RVi12VqUeBdT0/Z55mBNp/+oh/Krswrx/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 03:09:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 03:09:29 +0000
Message-ID: <6d325ce0-f5b6-4e81-9f66-d48d1e9e2000@nvidia.com>
Date: Thu, 22 Jan 2026 19:09:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
From: John Hubbard <jhubbard@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Gent Binaku <binakugent@gmail.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
 <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
 <03f705dd-0135-40e8-9003-5d2a626bc439@nvidia.com>
Content-Language: en-US
In-Reply-To: <03f705dd-0135-40e8-9003-5d2a626bc439@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cb5b02-20a8-4c37-0340-08de5a2cd2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzY4eUwzY2RtMmY0Tzd3TGxMY3FDN0ladHZjalFyS2hSRVFzaThveTVnKy9n?=
 =?utf-8?B?M2ZlbFBISjRUbWNPR1V0TTdheGIvKzNOVmw2SUtVMmROS3kwWFIxbUFHRUxO?=
 =?utf-8?B?d2xQZlBUcmF6ZzVTdWgvUlhzdVFmbHFWenhGZXFSeXJrZmdlOVVlNUh3TFhy?=
 =?utf-8?B?T3FLTEJYdE5hUnJiQlVaYnVRcUdrelZ0NlVtNW9HSXh6MWp2YUJSQkdhQ2w5?=
 =?utf-8?B?MEV5SUZnTkJqd1F1YTh6K0cyT0pKR1lEOUljd1FNNTJLbmwzTCs5TEt0a0xX?=
 =?utf-8?B?MnBrdEZxeS9HaDFLc2QzaWtqS0NWYzEzTVlDZUY4RXNGaWprVVFDVG93cTJs?=
 =?utf-8?B?c2t3SkhxZDFIOWNkbUlhRVR6MWpPTHdOSXYrRFFvWnkyYWNiZ3Z5OG5CV3Q1?=
 =?utf-8?B?RThMK29uQjA2Z01yZjc4Z2xQbkVhSGg4b1pVWmtZTDBTNisxZHlaMzN2WDR1?=
 =?utf-8?B?eTRyQy9qc1VYRU5FL1dqTlJzL0UvSkdLOUdlb3NkK29FMzJkTmZwV2VtcWp5?=
 =?utf-8?B?RThYRHF3OU56djltUFRMTDArbGhmTE5aVzdPNWI3S3FQeGxhVUlET09tZ1Js?=
 =?utf-8?B?VDRBajBaQXMyKzNpb0FnUmdWaDFiREVWcy9GTzBiRjFGT1ZBaS95bG0yc1Vp?=
 =?utf-8?B?VFUxakw3NE54aHpaOGFLRmY0SEVPVFllMGNjSmpxbDJQbm9ORnpnc1BidU0y?=
 =?utf-8?B?VDloSWFOS3hEUitJY2JBdXZ6czA2TlB4UXFDL0k2NUxPWEFpQmUydlhnN0ln?=
 =?utf-8?B?cHppV09Mczd3bFhXOVJLTHp4a21ac1l2QlhXQld2aERERnBDUmxhOXpUY2JE?=
 =?utf-8?B?Q0h0YnI0VzBsL1NPTHllM0M0Mm82dEhiWjBrM3RFQVlERnNBZmdNK3p3OVcr?=
 =?utf-8?B?K242Q1d1cVJMbTFpTmczMndDYmI0UmRoK053cjQwOVgrNmZ3ODM5dlJYT3hI?=
 =?utf-8?B?MFByY2Fjc2Q4RXlqaWg2L3grZjVSUUpYK0h1bEtzbGxMWXRXUmR1NE9FWFkr?=
 =?utf-8?B?V3hSbVFnZTNyRUFvTjVsazFoUzdWcFJpUHVNeTdoYW16QWV2d1dVWmZKL21T?=
 =?utf-8?B?NlVrdHdVeXN0bmRoSUp3b0plUzNqK3BQOUxXd3U5TEdtQ0VNYURQbXRHWnAr?=
 =?utf-8?B?OEFGYzJVSWNJMWhlVG40a3g4RVFJMGs4dEVOTDZmMTlKYzZJbE5KSVZVNlhj?=
 =?utf-8?B?eGFZUzV0ZUJuTkNuODNsVkV4aHJUVmhZd1g4Z2RxMjBsRUs0N1lFalJXUVR1?=
 =?utf-8?B?d3BRakdEWG5WUE1tUzM2MzkrUXhvYkJZM1RpbDg4ZlNsMWtHcC96aGVRMHBP?=
 =?utf-8?B?VEp6Z3FycGoxK1Z3SEIrWnMvL2dBbE1nWHNxU2J3eTQ3U2ROWTRlaGhDV2ZX?=
 =?utf-8?B?cStkNkd2YjlkVDlZQnlDNzRGNkYxcTdOSnRFNjNyR2R3Z1ErclYrRGdtZHBp?=
 =?utf-8?B?VHlkWGMva016bXVTa0R6OVkwc3dvbUpaUFc0RURWZGY1VnhCOUhQekUrR2hI?=
 =?utf-8?B?UGlWRXlrdGhYYVhteXRKWlk1blpneXE0M25hVnZzazk0dGRDZ0VZWFpxSnJN?=
 =?utf-8?B?YWd2RGdtNjRhTlN2VXNQd29kS3pDMWsvTnc4ekF3Rkc0NGsyd0NiRXZ0U29k?=
 =?utf-8?B?eldPdjVRRjczbmN0cXljK0RzUFNlaHRZYUpMcGNadkdlTElNL3huZUN6bTR5?=
 =?utf-8?B?Z2w3anFmTmJTZHhrYlI0SmxCT3h0ckZablRKWWFSeWNHdW96WXFyWE9FWXA3?=
 =?utf-8?B?UDF5SUpwTTI1MVlFQTJpUkV6cVI4OUxMM1E2OHdUSzRwa2xCeThKek5yVCts?=
 =?utf-8?B?emJXVGJnYmIreUo5bVBNS3h1c0lvcEEwZmhxZ3BPNUp4Y1pJbGVjMzFCSkdm?=
 =?utf-8?B?K2RlQVc2Q1hYVVBSaERUTTE5LzNlNURSSTRYUWd0aDlXSmxackFPZUFKOVJ2?=
 =?utf-8?B?RUJqb25Xem1wQ01HbXZzOE5nWmFKeHpZNTFYcXE4bUFVWkQ1dUIwVGZIc3Nm?=
 =?utf-8?B?ZjFJZSszVC9BaFJzblpieURBNHFEZWxnN2kvRFgwRUhrdjd2QndwRFdId1Bq?=
 =?utf-8?B?c2RGL2tQdTJ2cWhzN3dQMjFrd1V3akhyUlFnbS9MT01iMnhPejd0cEVJWHVq?=
 =?utf-8?Q?+Ra8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlowZ0dobVhzcm1sbG81dm9mTG1LWTB5cm9EbkFkMjJrakFMYWVqZ214ZW5n?=
 =?utf-8?B?bzh5ZGFQbXRKbmxHaTllTitvVkRWSE9hYVRXOU9NTTN1bVZXSGJJa2tLWWVn?=
 =?utf-8?B?RlRtbXBLRDg1ZW5VeHNpajFBS0sxbnUyRGJQMjFwZ0MzVEJ3VUl3QlV3dnFW?=
 =?utf-8?B?cy9HWnVIRnBOSndGZ1hnZy9tdXJ2TWVWKzF4L0RDbXJ1cmsxT1haTHJjTzU4?=
 =?utf-8?B?ZnRxN3EyeWRXK1Y1WDZ6RGg2dGNhcmpzdUZWYi80SGFuSWpNNU92RkZZbUlk?=
 =?utf-8?B?VG1UUEJXeTZYeGxQdG5udVo0OUxNc0laT0ZGaVZrTGk2Yjl2YzdDMzhnQ3Vx?=
 =?utf-8?B?WFNFT09OL2srZTFmWWwwUlZKTE4yYVplK2xsalNYZU9MWlpCNlhLaVROZXdW?=
 =?utf-8?B?bGgxTkZUNUE0ejUxNVJIL0g3cUtGV1d0dy9UWFlLVm0rYml4OHAvRTF2UkhR?=
 =?utf-8?B?ZkJxYWFUM0NyaFZaNktOblZVQjBXTy9mUWxIWlFGbUhXZmtLS0E0QWpPL0pE?=
 =?utf-8?B?cncwYm91bWFLaWtLMDMzYmhQckNMUktQanBLR3ZZQ3hGV1NFZVN0eklTL1pa?=
 =?utf-8?B?bmkxYWUvSXpDOG5QbEowVVNISWdlTHhlL0o4aFZUcUdTK3I3LzZpL2hrckM4?=
 =?utf-8?B?NnhVNnphUlNKa3BHaS9vM0dwaDhrSmFaWUp1MzNVTnlhdzA4Sy9qV3I0SFlr?=
 =?utf-8?B?c2t0ZjZ0YXI2a2RCdGNzMW9pRDlMdVF1RGdyNWpGQjdpQkZFTC85NGtCakhR?=
 =?utf-8?B?TUZZazNJTzNnekZuS2hxcUxrN2ZSemQzbmdPLzZkeFZmVlgwd1dSUmJMN3BH?=
 =?utf-8?B?aEc4Uy8xUkQ4bkJOOHZ6NUIyOTBiN3pJbHA3b1Q3WUMyaEZQWUR6N0ZxNjRo?=
 =?utf-8?B?NnhxOThjK3MxdHRycHhITC96SjdkSGgxNlJSOWFjU1F0RWx1UndoT1REUnVl?=
 =?utf-8?B?VzJvMWsweklnMmZCMTAyOERCSHhNYXVOYTFmL0NvUUZVTGhmWENscWhBYU9Y?=
 =?utf-8?B?U3VsNmU3TVpTaHM0aXcvV0FGRlRpSCtTQ0taU09EZTlZOGoxdk1vQzJQVlJz?=
 =?utf-8?B?UzBpaG96OFZvdTh2TDZkdDh3YVd3NnEyL0plckxuTnVtd2VXRUpXU2hNYVpM?=
 =?utf-8?B?b3ZTb3VxdHNpYWdDOGEwd2h6K2RJWWgzZk5jbUl6SHhqejhablNqMkpQT2hR?=
 =?utf-8?B?cER2M1NrUExrbzFEQTV2WW5XejAydlNCS2VaNngrU3k1UXREU3YxazNBTERG?=
 =?utf-8?B?OFJrQ1h4NG1hRkpqN01DOUhYQ3FtZllvWWFQN21zeTlWd1Y1UDJjYkhzcGhw?=
 =?utf-8?B?TG41UjFSRS9aS0FxN2h0NkVoRWhmVDQrY2V1OEdVN0ZYVkJzOU1uYWRSL2Q2?=
 =?utf-8?B?VEdPQVFONmxmdXlLWGgya3loUGNXaEYvTXZpVDUwT2tRNHFzbWdHU2d0c09B?=
 =?utf-8?B?czlZdUVSRklXQUZSa0M2UTFoeWZMQkNjTEZBMjFuYmlVL3BGamZTTlQ3TWto?=
 =?utf-8?B?MU1RaTBKR3FoSllSUG1qTlk2QWNOc1c0VHpjcTRYa3BsdnpIaUJtbjZTbXdh?=
 =?utf-8?B?cStBamlKdVI2VDdEdkxsMVl1S0htbjd2cUlNNUNLUVgwS0J0QUdWRmhQdmx6?=
 =?utf-8?B?OHE3UnZkaldVVC9HNkVrZ0Y5OTZIdHNiSXhqVHFPcWJXdWxpYUZLMDdJV0M2?=
 =?utf-8?B?Z3BJcnFuYUlSbDg0bkc0UGVtM2swa1lDZkNITDVJNWZMVEtZa1EwQUFMdHlI?=
 =?utf-8?B?NllqZUV0U3hoU2ZhL3V0NmpOYUpISTRNek95UW9PQzRjNXRhanRNRnVxdmMw?=
 =?utf-8?B?NWFDcVB4Tys0SGR5NUpXbVZRanJ1MkNOMlUzRE5FR04zZlMzK2pQRnd0OGxr?=
 =?utf-8?B?Q0t4NmJHLzR2Znpmc0p0akkrYzlRNzA5VVBML2Urc3cwMFUraHRDejNUWWtI?=
 =?utf-8?B?ajFPNlVqR3BzbG9UVmRYQkJQenJ2THhvUEJKWnZZU2Z0K3B1V1VCMTRkeW5h?=
 =?utf-8?B?bm9XK25McXdOY2FEdHNqYVVvOWdhWEpzdmpPMkc0cW5Eb05XUk1XanZwcHN6?=
 =?utf-8?B?M0pPenhZYWNoUEZONkFibUFjNTUraFZiWTBER0RtVzZMcWh3SS9CNTh6eExj?=
 =?utf-8?B?c1Z4MXFJZU9kT3JiZklPT0s1cmlHUUFlVFRKaU1KK2h5eFZjS1BrRVVNempR?=
 =?utf-8?B?TWtjV1ZESWtlaU1kdENDbzNpMzhaZlVGMS9QOFVQVTdsS0JFRFczYzF2cDVU?=
 =?utf-8?B?d0I0MXhTMElsMGlkMDNrSEdKaWNNQVhGdk9IVlYwRmQ3RWUxV3o1ZVkzc2JL?=
 =?utf-8?B?Qy9ScXZuc0k2RDFRR29OeHFySHBncTUwNVV2Z1JFekpuZjBUazBvdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cb5b02-20a8-4c37-0340-08de5a2cd2cd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 03:09:29.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1f9us7Xw59oU+DRstBtwJOLU+ilHtwpW351wTH8cXVk+4caYfa39/MOJ/deulEZP+LWlOmlOd882uSgSfzaGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

On 1/13/26 6:23 PM, John Hubbard wrote:
> On 1/13/26 5:28 AM, Gary Guo wrote:
>> On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> ...
>>> +pub(crate) struct FbRange(Range<u64>);
>>
>> How useful do you think this is in general? Would it make sense to have a
>> dedicated PhysAddrRange type in kernel crate that provides this feature?

I still like this general direction.

> 
> Pretty useful. Yes that sounds like a good move. And I see from Miguel's
> reply that Gent Binaku (+CC) has a patch that proposes adding a 
> PhysAddrRange. I'll go review it in detail.

(correction: PhysAddr, actually. No PhysAddrRange just yet.) 

OK, I looked into this in some detail. Based on my experience with this
area in HMM (a linux-mm feature that deals with both CPU and GPU memory
addresses), I'm pretty solidly convinced that PhysAddr is meant for CPU
physical addresses.

FbRange, on the other hand, is intended for VRAM (a GPU's dedicated
memory), which is often in a separate address space. So these should not
be the same Rust type. We'll likely want separate types for CPU, GPU
(or "device") memory, and even DMA memory.

In order to avoid seriously derailing the review of this Blackwell
series, I'm going to continue that thought, in more detail, as part of
my review of the PhysAddr patch [1].

Meanwhile, I propose letting this aspect of this series remain as-is.


[1] https://lore.kernel.org/rust-for-linux/20251122055256.264180-1-binakugent@gmail.com/

thanks,
-- 
John Hubbard

