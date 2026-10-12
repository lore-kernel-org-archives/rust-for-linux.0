Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020085.outbound.protection.outlook.com [52.101.196.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FB41A91C;
	Mon, 12 Oct 2026 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805356; cv=fail; b=HbqdUagXYluE2wxUmmcKpEDHPJn6WqfxQAA9B53RrSN4ls+fic1yrZyUiUGGaRsmu2A3Xge4YZRXFoutyauPDwuDEDewbmm3GPO4VzHt/0zPWX+lSxTlBGS0AG8h9+7bNMmnTcWFEz3mPKg6+1iVSo8/lJafWTDQ2K8UdVxzNRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805356; c=relaxed/simple;
	bh=t9U/mDMY2JbZuEBV8DS+QR2pEsRdZBgDatCAYQ/uTy0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=dSXcOxb+7YbsomehlCvL7fAFSke2P2zXT0VuocayUNdpmmidfGZLK02H1e8WA6kq8hq/EDbcx5Xl+Ph3+MMedkABUUtTNzpAo1biK0o5DFDPC5rQ7LWejkFNtNFhy8G8L3rujd7Av79I49IG9IRUS2NOnMI2YTCi8BB3Dc3EhOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bF1pBeu9; arc=fail smtp.client-ip=52.101.196.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bF1pBeu9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J86LY93APPTQuokuDpQQqnEHrgSdT8gdZlTrlFpfpsAXSKCUl6YJ/+PnsQR0fe8uho7dwxDypOtNLCni8co2BcujfUZMD3RFPtaZeg7LnxUCNMwvs25E/gDMv/u5PO/K3hhGigqFdlWxmIHpewrTCprp7sIpS8CrX50aKKDFnFDEy8jZW5Mo9QxN8MC48flrcK2M3kM570pxjrSgAPUvweIh8fB+EB+VqsnLcGZGwfWGzD4bOJMlpan5WLYfYcIJr4NeIpgV5YEfDoB9Vsl8TFDnSzQ/qdynpW1QP4yhTC/LE1ZS5idDrvKX+gU/Jp5kWMUTZj0EflBIzCtmnfqJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9U/mDMY2JbZuEBV8DS+QR2pEsRdZBgDatCAYQ/uTy0=;
 b=HshOppknhii5LqOIXb7cca0FwFl46RWpAfSgCFsAgN9Ov0GM9QyuBF4FJ/tacQQys+2Ejz28krZy4SZIwT8xW2hGt7YReQqNh5v8dHusgMF7TZE+2I7GCP/z1VLhISw8B9oWJ8fz0EvKZK3+16K6FaNGIm9rBVJ4hO87cYmyu7NLRSPCnh3okSJbI6G226ky/Vr5frkIW3SjnhhCl6OYSwl1Ai8FpEvkX6ZUn/WIGBV1YZ6QylOVirFjbLEyvHdX8Sh2h7J/llPy28aLVDogDRtiXjDkSeEfJtNNctd4btpofpDJGlidGd8dmwG/YPAYBcNxC+FaSreM3a68sGjLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9U/mDMY2JbZuEBV8DS+QR2pEsRdZBgDatCAYQ/uTy0=;
 b=bF1pBeu9cyl+a08WFfAx1sqhMpvsN2KBcV+628N/fhY3O1ruhS8jAxtoLUoQQbZhEfL+IpUnUHvzKSbJRcd2WeXHFjS9RGp9xFHYJYDWqMZicCK1dzOoXvM59A5kg79p/qHgG+pfbdvORvr4RgU+YkrvNUdooTOmSJ/hkP4SfOQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CW1P265MB096023.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:2a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 11:42:31 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:42:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 12:42:31 +0100
Message-Id: <DM2TZIO2QALS.2H1R3AV8CBCVE@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
Cc: <lossin@kernel.org>, <lyude@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <daniel.almeida@collabora.com>,
 <thomas.hellstrom@linux.intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 2/6] ww_mutex: add ww_class field unconditionally
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <168394bb52a6c68b0b760fe00413c899ab95f8e3.1791799752.git.work@onurozkan.dev>
In-Reply-To: <168394bb52a6c68b0b760fe00413c899ab95f8e3.1791799752.git.work@onurozkan.dev>
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CW1P265MB096023:EE_
X-MS-Office365-Filtering-Correlation-Id: f900a766-8da0-4362-7a37-08df2855e68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|23010399003|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	zLDEICUxg07kGcn/1+mzxMjgQre2voULfJ0BR8WPqciRmPRuAxNdgDqkkx3qwTZ2lf9gd00ChpQF6pCkLVrI6daSytkp6ZUxFPZI5VvTVZtx6YHS7apFcsKvjWSnX0fGsddGnG41WA1HS5nFzoPzEZhK+ZwV5+Kz01JI/zhHIscKDP+NyD6kCcsAOYlWkM1oUnVlctpkhSIas25rDqNZAwgWfySVm65S8D8vXolb5JqgeCcyebnlVVq+x7UCUY5zuOBMmcCRZhNp/GN3zEqzl7ev7KfavvkjdHlFNYDpzzUiYry2AFf6c9qH80EoqNkWPFqSEDTov2TR4gAVpXHB8B2wuIGfk4oqrZFUS6ebxg/PRZ8zCyUWevX8CmluQlZn2ucUHT6aHL8z5gY19/rowkptxQud5cCyBFRsGtoAeOoYTILRD/AG+/y3ppruTfX/CSUAprk8c771DeclStK1ZOKxnbPKBuURgZsO6G7+Z3lgkZlTE6UaE1TDKGr1o0ZyKDuQM9Y682YfkJB/tTUIJFVrd9ayo2fk0Tc84RvkqA88nHtW7UNWaYb7yvBWxQWHPMAFNByBtxSqNiJSJE1reVhHhcjxqqCj421C1HIxFv7kP1uN3caR9RFO3DzMZQFQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(23010399003)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkJ4ZzlOM05kb3dJTHJKV1ZXYXFYMktXQWRWaE5xa1JkL2UzQW9hVjQ4Wmtm?=
 =?utf-8?B?UmY5cGdpcDlnODVaTnpTNWt5UW91ZmlHWWlhVDFKQmd1YVkyWGFBRTdnOHZG?=
 =?utf-8?B?TklKOGRXZEtHRmlZWlF6VnYvMDN0am5nSGhxbTloOXd1dkV2MjFLeHRwd0Jh?=
 =?utf-8?B?V0NnN0RuZTIyOEVyYm9paWJaQlpBcmxXTkF4OFNlMS9BQ1lNYUU5dmdlU2FV?=
 =?utf-8?B?RklPMndQaUNCL0Z0aW9hckdlWG0wWDdPNXVuTGdod3FxUFluVHZyZnJqWEhz?=
 =?utf-8?B?OVFiUGdLdFkvY1lod0NpVkFSVkRwTnQxd2pOZkxTdFhEeVdBaDhHMWhiR04v?=
 =?utf-8?B?blA2VnlHdmpONm1acmE3ZGhZb2hMeXozSXRZS1E3UGVoN2JFVlNrM0JCemMy?=
 =?utf-8?B?VmlLMjZlSzVsVXZIYXgzczlsdGFVVzdydFVyTGRubUIxcU95RDkwdmRxL2Rp?=
 =?utf-8?B?NEZoUUtyTTR5d3dRZHpSN2tnOGxOTk9MMURpNU0yZXV3OXprdFVDK0tJakpX?=
 =?utf-8?B?cWIremZUSXdvNFp0UE5SamJVcWNSQUZ6clZnTXRoOVJiaDlhazZ4R0E0YjJM?=
 =?utf-8?B?YUJXN3lPZ1V0QkU4TTVFYXpwS1RBNVJkWDRLTzlubUVEN1psS0c2dURzZVZG?=
 =?utf-8?B?N2d6UjZ3bFc1NFFtbUVFa0lyYis1MDNqM0lWK21XWmFHdkk4Ti95ZGU0Q0tF?=
 =?utf-8?B?VHBXT0tjTnZoWFBFcHEzaG5vOFJMaFgvNlI5a0g4YjdlaTFPQW9YUzhBanRW?=
 =?utf-8?B?emsvWjByelhyYjF3eE9RSHRZNzAyR2Y2cDl4c1RYYmMrOHVsU3RxZ29KRVRN?=
 =?utf-8?B?UDdQZU1RTEtla0JrZ2JuNURTMCtYa201QmlndFpCOWRTUzBVM0xiYnNkUXU5?=
 =?utf-8?B?OGtEbnp1ZHFYVUZZbXdiOUJqTEFGUGdpblNBZzdncUFta2RaVGZRYUhtQWpr?=
 =?utf-8?B?UC9tRWc5bytSMmhTNFpUN05ENktUaGdhMktQV3FxME96U1R5dGZnNFI4RVpW?=
 =?utf-8?B?RWZ6NkVoUDJrSmNCZlB6WTc2ejNFZFIwbEQ5Zm9kblZUdWhpSmFpcm5UTWFM?=
 =?utf-8?B?Uno4MWdzOHhQUDR6czhBU29yOFZ6TU5GNUYwbmo0YXhZamIzMGxYaFRBMUJN?=
 =?utf-8?B?R2xEb01LdSs4OFVDWEtjclNIeW5qcEhpNmh1bEhBQWxvN0Z0d3FyVkh6Vm1G?=
 =?utf-8?B?bWxvbzd0WG5sZmJjNDJmZlcxRHN4dXE0R3BQN254TmY0RHNSOWFNcUpFbmkw?=
 =?utf-8?B?SEZWQnQwN2czSzhyM2tOUVVZRC96a3VMMlp3akcrakppejB6SlY1NDVwMkJH?=
 =?utf-8?B?Tk9yUFpkYTNFV1lnVjFaOHRRZzR4SDYydDJQc0dOd2d2RHBZY2hja0dYQmdW?=
 =?utf-8?B?YUljbWdkUTZXUlZabVl1d3BmYXBCVTRTSXM5a2tMWWpRM1VVVTlYQVMrdEd3?=
 =?utf-8?B?azVBMUV5Zm4yaUJEWUpxVThoMnZhaHVhTmpNYU9pNTJBTVMxL2crZVg3Y1R2?=
 =?utf-8?B?UTE4M041NStLYUdjT0RWSnc5amVyUlBRMllGODhiOFhxRitrWTlRWThNQno5?=
 =?utf-8?B?czgwaGJzQUt2Q3NwOTN6K3dCNzFMT3pIMDBIMXFERzNyVm9FUm9sV1pua0Ux?=
 =?utf-8?B?U2NBalhidmdVQ3U1V1ZveE83M294V2JOL1gzcmNtVTJDdS8zdk5Gb1d5U1dI?=
 =?utf-8?B?WHJPL1BiNVluYkNEZUhXcFJZZGNROUNBM0pabEFqN2crQmVVTjFQZ2ViQ0Nv?=
 =?utf-8?B?UDFaOUNDQ3BxSTJjek52THdOWjlFUmtnRE13anhkbTIzVnh4R3lKU0xvRkhE?=
 =?utf-8?B?UlYvUlgwcnZLZ1l1YlB1QWl6M00yVkhMUjNUNER4ckRFZjFDVEdQUDU2UzQ1?=
 =?utf-8?B?NWVicW5EODFqUUM1VVZneG5aTHh4eDZINmEzdGtKK1pHR0hxRGFPTDFMblk4?=
 =?utf-8?B?K1B4NXJ5UjJBNjN2VDNkcnI5MnNSQkVCSmZ4azhRNGNidlBOU3B4cnJsVC9Y?=
 =?utf-8?B?dFBSTDl3ckdPYkdXRkcwR2NuUFJIYUtQWE5qV1BOR0NNWG5xMFdIYWVSekdH?=
 =?utf-8?B?OGhPSy90Mk1aZkRkSERJcnB0bDFpVFhYTVZDbkFKSWZjY2dHQ0RVQ1d0WjVq?=
 =?utf-8?B?NWJBRjhxNDdDUTBlMjB3dU1ZUDZFcno4ZG1KeDg2Tkw3T0hVM2NiUVp0eW5O?=
 =?utf-8?B?NG11RDVoSzRIdGpHOTZsTHJOR1hqa1NuZkwyWDhjaXpTaC83d3Jia2thQzh3?=
 =?utf-8?B?WDNROFA0N2dETkQ5R2xRZk92em5SekpBWmQ2NmpOSDFLd3NudHQyZlppSmk2?=
 =?utf-8?B?b2tycTZhWktpdWZMWWhpenNTL3gyekQ1b0RDV3ZhNEdXdUJNd0hYZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f900a766-8da0-4362-7a37-08df2855e68c
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:42:31.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/8/tu7CdBqvMbHeNs2KkBDvJp4EXm4bpQTVqzj57XXv4IolQ7pOPVb9SX37pDPu3tu0evKFtCqnFGR/tgnTTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB096023

On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
> Removes DEBUG_WW_MUTEXES guard around the ww_class field
> in struct ww_mutex and struct ww_acquire_ctx to always
> initialize it.
>
> Keeping the class pointer available unconditionally allows
> Rust abstractions to keep from_raw() simple on Mutex and
> AcquireCtx and validate Mutex and AcquireCtx class pairing
> in much simpler way.

Is a mismatch a memory safety issue or just a bug?

Best,
Gary

>
> Link: https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@co=
llabora.com/
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

