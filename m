Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3571C5F39;
	Sun, 26 Apr 2026 03:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777175902; cv=fail; b=cHNicckjZvPubbDlL0A41vwaWObfeYh2CDPzfwDWyltg7ikLpY4WzeeGkkWPPOWmAMPWRxNCFamNlLDtdVOKTN71pcu5fCiA3KaYmdrt+zK4bhsQAFCffXAiaYTegUnphrTsyWLF1odiy0FOfTvwD+bke6uX6EaZc55o08YxYM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777175902; c=relaxed/simple;
	bh=s7+PSGe2F3BIDw8Efid1KAW0cSJyjtGfmC5f1L1Bs54=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S6r99m1OS+nA/0wlY6NzDWWvxTOxibrOgTJpfdLQ3JH6KEgt4PVcJShtbyauwodaiTJzhYCFbl38Pm6aR6A5HXAZX0h3luK++FjyvFMLmxybv0ONt9l+qEiyv+49AE0uSBRLnhbQv1G3T9BpFj4Po1+/AqANs018PVJS5WpAIn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H4/1ezeF; arc=fail smtp.client-ip=52.101.43.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H4/1ezeF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRgXWpQxVJZT8u/Dtsiyqjt5GxIP5A3Lj1uO7GuwhRy+IcePYmMUvP0BTiiJQWHsz/fSgBGyni2JmQkjFSdEAoo+itzHzpOgde7QBNVn2821uZ2Vx+bFQK0aIBSp/HT5Fa6qu2bUFB77ernRhk3Y55/vj9ZQ+0qIPHuxonWdQ8vh1M09aonFIIrodVlokw4SM37b4VTYELuFBAMMEtN6Fxox85D75bAz7CDrtHDvQTusXzU7fk175kyWN/VyZudpKabhxqotUU6zbLe3py5gZYuXW916bVeyFVz5uVxgmqstjeYg3ZJ48cPTjeHr6gJhjWvk04jFvmmCp6vKjAfGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7+PSGe2F3BIDw8Efid1KAW0cSJyjtGfmC5f1L1Bs54=;
 b=O5TfYtU2qKtHX+4TkxuS7BTX4k8Bv9dxjqNq2uDgVATQlHuBD9iX5ArxAmBzrtFBV/qSng94meNWkn1Z6MJA5MuYziZOFwbRDx2k9An99fFQkPMgNSAqdmhu+LN0Os+2uzv0Rkw0p4jNDCOIWLDRi9+WDEBKNVdqS/fnRc9tWL5hZk4iVgxiRSvqcvgDxMOQ8fMKJ9RwN0mena86CPDTdqczxmD3xwkcA3GAN5vZczE1f2C+BwQeT7nC87TPOi5z3DzyOx4bwcsTNomoE/++ydH5MiwyKURhBZAXTjwWlOjeED6XlCs1wVvSUOl2iVgLTjVPFJG/3Ayo75Xn9o5Egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7+PSGe2F3BIDw8Efid1KAW0cSJyjtGfmC5f1L1Bs54=;
 b=H4/1ezeFIZ8+nua53RqLsEFPPJLRw7TE15OQZ5VfNv4CoEHxEYgUArfCh/K9wUk96zX3+WiYDboncKImU1foJWE9sICDR1NqcI3lXIIeKNmrJxllv4jaW04InLoexDotsftsGhe+9sX3uFotBOSqt3rYHyA5tkc0Tr8XFPi1LgdFrPmYPfgmgEDO3gpve7Nb+SrdX5dl/vzqy77WsqThP2t5yuSUrfnOxd31jwq/aC/aW36GWx/9W9AKdB6POedYAYPGnKoNM3emNmFArh75x6hJCaxU0xbBmf/KfJh4Z1YlU7LX5JXeAZ73YriCp22Q0Nw/mjcEIr6PXSCdGKfdOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sun, 26 Apr
 2026 03:58:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sun, 26 Apr 2026
 03:58:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 12:58:12 +0900
Message-Id: <DI2S9Y5QQ1EY.GHAYDQNW736G@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: alloc: add doc test for `Vec::extend_with`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com>
 <a02bc604cde78ba505441a5555400e6f575e8a8a.1777111268.git.yu.whisper.personal@gmail.com>
In-Reply-To: <a02bc604cde78ba505441a5555400e6f575e8a8a.1777111268.git.yu.whisper.personal@gmail.com>
X-ClientProxiedBy: TY4P286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 85cea952-ef33-4798-3a57-08dea3480bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8uAtwStgD1/Ix1GkngKjHiIKdbZsjFeYNgC5gD9f/9wx66Ir+UMPx94FavxmatCGcCpOON3vkHQ22kbbVK4qKnFiJXl/luEfovh0K3OgDTJGm+NWlOkwhanX49DnI5IbFwnPYXle7NGhaHIO/M8GaNIwlWehMtmt8FG+a8khNJ8Ln2JzbRP6+PkIiap4hVCrgb/H6RSE0Q+YvVxu8327thDriVTmepZozX5TehJHeIjvvaFIH5MODFfOMtOd3r0K/CpENNmzxm3W3pVdPUaZzMEXOcLIHwsP+yGQf3R9j+yrAU8O/4b5iRrb2MCxZuo8/14jTjUu4yxFcayAbBBNjZ6HAvS8lSnf03A7Y+i/Y9S0E9FEFMtHv0VQOl7U07R1c/te7+zxTG6yPo83Q+K1P8GENjE3wnkbykGjVmZ5BuhGBAwdAE2nvTb4WmJ1BtJdpJh5Su9pnx6pHC/rSgSryxZ06PNyWXF2REcv0UZPjMGPfllhdZ1gc2yLmfJ+tmDJ4lAhW3341ejmv+E49xnY+5nz7zJyNpBVqs90bTwGJyeamlqexqtAY/UWbfBYaW5koy60c1TYVpes6jkcSXxaj/rBbdNusLOUvGKPHe/wISsekiDmlIWH5fakO+It9nKhwLSpIq+2zoGXPcC/vf/0kZqd9vc7HUHmZyiwfIbNN3eiwHPEnVPPvogS1wLZJ9w7sgcNqKfWeaNBrXTMZMPIUGUskGAJuzg4M2Lv47fzx3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVoVzZqU1N1d3A5cDdKcXh2WTVBclVES0FpWis4bkRRUTNIRHFGNU53QzhK?=
 =?utf-8?B?YzFWdjVvaTJrQWc4UXlBRjBuWGE0YVdib1Q1bUpaL3UvbDFkRTdKdTJIcUx0?=
 =?utf-8?B?S2ZMNk56VFdCSFI4TlU2ZUhla2RjWFZoM3VtZFRuMTFxNGowU01SdGdPVFdw?=
 =?utf-8?B?UjJtN2QrOGFUT1NIZVZnMWJldWRSbWZmZ2p5UjY4MzZUbWx1eS91MUc2bUh5?=
 =?utf-8?B?NHdaUW1YdVlpSlQ0UjBraGFnelh3UjV5Wm1zVmRHbXlKV0pGS0FSaHBSZTJo?=
 =?utf-8?B?TWJDckkxUlQ4Q2NWd3dvWnpDem1ab2x6OFVDSFdkaVhXMUtRbWhkcVhOL3Vy?=
 =?utf-8?B?M21hVTd4eFdOekNadjA0d0lHcUZ0RlhNOWo0UWM3OHN4SVlwVk1yYjRxWTBw?=
 =?utf-8?B?MHVjZTBwU1ZPVGVDQUlWdEkrSW9waW9RY0ROVnQ1OHA1ZGtHczFxM0xKMHNp?=
 =?utf-8?B?MkZFUG5XWCtvdklLZGZybkJuRmREUXQxRzJjSkpaMy9mSC9mQ3VGSm5CZURJ?=
 =?utf-8?B?cjc4eGtjMHQrZFZvMVFTNzcrOVZJdnN6bGFHb21BNG5WU21IWHQ2VjhPQzhI?=
 =?utf-8?B?UC9RRTRZREN2bysxRzVSMzJZM3VnMmludW95d1NOaFBxdzUwUXBXWTdnUWow?=
 =?utf-8?B?VmNhaXNsbTE0NU9JV0dEbzhIVnpVTHZTa0h4MTRiSGg2N09QMkRWZXc2WU0w?=
 =?utf-8?B?NExTTFh0NkxQbzRxcjNaN3pGVitWU3V6ci95WjFIbU5mR3RzZHZQejUwanNj?=
 =?utf-8?B?WHlmbzUwU3lSZE9TYm5pS0g5elNpQU1TLytHcUNiRnZRUCtrckdtcjRML2J6?=
 =?utf-8?B?bmJ6OUNnQWZ0aUZ4Z0lqVklQd2Nwbm52ZzRvaVpxNkVZY3BtUDc1SUR4cTJE?=
 =?utf-8?B?L1JXekhmQTBKdTVHbEpKYWZab2VRc3Y1VmpNa2hzaWJQYk85ZWcrYVF2SlNt?=
 =?utf-8?B?bUNxbURZWWNmY1ZDZ2MyQ0N2Q1p0c3p5VEpLQlY0MkZZK0ExWjFXM0lNTVNK?=
 =?utf-8?B?bjJ1RVZoR0lnNFBibmx2SlRJSkVtRHZKUndyWnNwbWtFTC9STVRrSEZoejk1?=
 =?utf-8?B?QTlhMG1VY3RNNGpXLzZZbmxSeUxJZ2l1MlArUjlhMDRYZEFBT0U5WW5lU2p0?=
 =?utf-8?B?NDZPK0FHQnoveWttdmxMZnhNdTdhblBucjhzdTV5emZsWUNTbTVMWHdRc0Qv?=
 =?utf-8?B?R2dsTVRiM055QnBNUG9oL2ZiY1JmVEIxalo4d0I2Z214aDVDTXkyWWJ1aDRN?=
 =?utf-8?B?STlDNjduN1E3NlAxZVBqUkd3WnpmT0xEaWlsWDcvTkFrdUZ3eEJTTG52Q1ox?=
 =?utf-8?B?c1RrRFlXQk1RMkZIak1mc3haaU1DRlNrWGtUTnpPT2V5eWFkWEFxSmJoaWdq?=
 =?utf-8?B?TEdNem9rT1RsaXp6N0dwNnJUc1dTa3BYNnk5RFRpd1VjcGVGYUJibDRmVFU4?=
 =?utf-8?B?elhGM2JCSHo5bUp2RmZKeGFuKzB5YWl6RkNsVEM4bUFsbVZoOWVvaU5GeVlZ?=
 =?utf-8?B?aHI3NWZOMUc3YVE3b1lpQ1p3aUxKZVFIODdscnlCcks4YW12cEdIaEdEMkxM?=
 =?utf-8?B?cGY2ODZHRC9uMElUcnJiUHdGUXVGTUZDdkRlS2V4UXRTaWpFOW9vc3JCd0ZO?=
 =?utf-8?B?bytuOTR6VmVzdys4Vnlkek1sbzNybmJiQmdwT25hNFNnWDJpZzAwejFvdWtj?=
 =?utf-8?B?dmFObkxSRlNXQnIzZmN2UTFJUDNQc3lhcGoreTRRVWQzZ0p1OVNkakpCK3pM?=
 =?utf-8?B?Zm5DWnUvWk1rMmkrZmVxeCtQL09VRm9CeTJjeDJSZURQaVJwQ01sbTJQd0o1?=
 =?utf-8?B?VHJKZXBzRkZETnJRK2dLbys2ZXVxSWIvODRvemw5bWtQUHcrR2VFaDBRRjRV?=
 =?utf-8?B?bDRmeExoM1lCWlVmamp4RjFBaUx0d1lWQ0FmMGY1aERueVZFYVZFYXhRZkpC?=
 =?utf-8?B?dXNNbWczd2UxVk0za3IzSXNXV0RqOFExdDRZTjZHcll3UDNWZXFqSDlhUHV3?=
 =?utf-8?B?TlRicjVlV0hZS08wc1JBYnM4VjE5b2gxc3R3NEtSMm0rcHZsbnZ5WlVKQk45?=
 =?utf-8?B?MVdlbEtTYXFTNEtlWTBKNXFrRmlrSVRkNEdkaWdGa3BPa01VRkQ4b1pxSDFu?=
 =?utf-8?B?QWgxWWdseXhidjhnQUdFZ3FYVWpqTk5UTU40MnJtb3BQZ3RQRGtFaGU2cnpl?=
 =?utf-8?B?aC9sTHY3emRLVGxZKzZZaFRNZ1oyRFdOZXFXdGNvcFN1b3RRZWRlTXFiTTBH?=
 =?utf-8?B?RDl6K3ZTSmx3K1J6WTVNSXozQW02WFVCdTJPaUJleGVhVEFWSlpGcWV6YTRv?=
 =?utf-8?B?WU9Ebm5jQ2dQZU42Tmw4c2FMek9oWUpsN2NXWCs1Zm91Z3VuZU1uNzhHblJP?=
 =?utf-8?Q?cZQ4flsn/hJEe2f/KIOl/Dx+jnnvQFrhfTaXo8kUoN79H?=
X-MS-Exchange-AntiSpam-MessageData-1: QNOvVtwmTa6HPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cea952-ef33-4798-3a57-08dea3480bd4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 03:58:16.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qcp6ZgsKTofM2+z4B7ETBc6/+qpks5QoZ49E4m0qMhw3ligNJGlGincdBwfWurCDBCseIRcTndWTmFvVlkZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

On Sat Apr 25, 2026 at 7:16 PM JST, Hsiu Che Yu wrote:
> Add a doc test for `Vec::extend_with` demonstrating basic usage and the
> zero-length case.
>
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
