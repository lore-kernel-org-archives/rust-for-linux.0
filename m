Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232D263899;
	Sat, 24 Jan 2026 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769260833; cv=fail; b=epuZV32RnsTXn9XneMHy8fBKV8JWs9suntFePkXEIWQt0vrXifqEQjWnSUmoDqM8ZuZqDMa/n2GUiEH39x3FE7JaeRqqPRRZ0dpYzpZTxvw2B3+bv8z0PPIYpPD6QgjcHkmB1Dq1/WynUdl8U6Qi02EGD4oP5HCQCGI3pDeJm6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769260833; c=relaxed/simple;
	bh=ZC5jB8wp7Ks+rD7NnChKuzGL9Qe3A7gpn+/khpMcyIw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l+eQ6xVfRcXxSGzA8Cc/4ck4TCM2rA7rILan8SxmvSlTTyiLDXVikunDb2iLwSPIvsF+MCvHOkIp/t/UAeV3IDair68NAAz6+TWJr8G4TiLfieoqhB4xbAoy6g2Y1eNKXS5Yz8BB3pfmhvk6x8PKzc6U852z2hc8W5DMVvadSYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zq/tDuha; arc=fail smtp.client-ip=40.93.198.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zq/tDuha"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr8fBIJy/YbEX58KhgDb6/y5UFSRjI0aEZU74plUstBkf4FqNzxuIvjsnk5uCukCmCKQTKQpaKtcu7lFxX5r+Pc3sMnEid3HXsBXBNjkl3Y0FGcSvJ8+q81jK2exk8NfxGKVmNM8h6HyUEoNVlHydDx+BFT8UWkKNe7V5C4nOOwmEj7oCtF3fwmmyp5Tehv3Aq70jNeP4svqYDLzTOL2X/8Zg3mBhdKT5pWqFzZ5gkRic4O0BCGaQ+cLLjkGnxuCgONtgTiB8kzKMkVq1i5qFdXS6wVrpHcc0EQjdRvxV107T7dInARIng9SgEcbfroZN5zUfZIAoPWD8sBDQoK9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC5jB8wp7Ks+rD7NnChKuzGL9Qe3A7gpn+/khpMcyIw=;
 b=y7krue3bGGMbu72sZQqxYFAH1l2hHUuV3PKiQglBtmCVScpB3L8qevg6VpbR8XH6qVVaUbM27loYsI31T0ywHnJ+kXUH3WpXVdiupYDHCPYpG9hFhTb3dRZZbaSiQhz4VvtfSNRyx1Iwz2MdF2FTbQVj7UPDtIjKUUqW2WBIzBJvhzoYxU8WuShzGa4rglSbiaZoxdS6QwQvrz2srdIc1/a0i5bWwYAEfVOy3nfeTU7YjMkAqyWTKNmM3G4D5OYLfXUd3SBz1+e+NOpEu5CFurCM/XOAeRzf9XM5UxZ64i5jXw8tg6zX33MG36cEJV8R9cXE65SnJ0qHzJGp9wJkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC5jB8wp7Ks+rD7NnChKuzGL9Qe3A7gpn+/khpMcyIw=;
 b=Zq/tDuhaa/SDemf689iRyWSjXAGaovuTT2XolB3xIYbd6xiV1ZsKUcsnl1XboPCwRcC2yRqv0ZLo4GbHPKPbLLvYkeH8AlbQ+mWfaFCgTWgtz3KmiKFhPTrshQP8t7FstipFbAMpjF/CAnmGs9tlg74Us1Z3dVSsUc8KNZmspG7LRP5pL84ZkLdGwJ3VW425/LJNKyVG0gtw1mOf7QsX2enF56Zk8+Sx7iQuKVwsHJ1SZWjf3vpIBnkOEvTTbyabOhULRcPutfq8i8TbPyYSm19RPF02X6K0bQ+Mx+SrNd4DsaP4jlFaEoEeMS6vsLgdcN2Bmxz1W2NyGc48UNOusQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 13:20:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 13:20:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 22:20:26 +0900
Message-Id: <DFWUMAUAZTAD.1F3OK9TZWTF0U@nvidia.com>
Cc: "Greg KH" <gregkh@linuxfoundation.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260117094710.24301-1-work@onurozkan.dev>
 <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh> <20260117140240.15d1120c@nimda>
 <2026011703-bony-unloader-9099@gregkh>
 <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
In-Reply-To: <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
X-ClientProxiedBy: TY4P301CA0092.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: a511fbbe-17f3-4547-21df-08de5b4b5814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2piSmpZNUUyWHFlZXd4b1FTM0FaNjh2UWRQL29tZnFFSUZTaHNBbWNaUlRu?=
 =?utf-8?B?TE1ya2F0K2JMQjM5NGhHaGhzMmJKdlFqMi9SbnU4U25JRm9WMlp2eGQ2NGZ2?=
 =?utf-8?B?WUtWbUZaVGlqaFF6d1c0anZCTnNrVTkyNW9GdWxWT1luSDdXQi9IRjM3Wko1?=
 =?utf-8?B?dUV5cW5vMm1iNFZVcXFjOElTalVCMmhIT2JtWTI1MHRoK0M1Mk9Kem8rSXV6?=
 =?utf-8?B?SHZWNHFpTjB0aUZSdTZoUG00aVhlSXkwSktBVDIydkVOd0NZdjRKNmJmWlYz?=
 =?utf-8?B?T05BZDd2eTJmQVMwTTgydTFmTzA1RzQxSDllc1hWM1VSNEhsVk5mYlRrZVVs?=
 =?utf-8?B?YkNmS092eEsrcjdZczRqRDM1eCsyWjhNMFpDNzBDcDVFVUJhRzV2T1pyNmpL?=
 =?utf-8?B?cnhEbjlvWGxMMnNUc3Y4YkdtT1l4UWRpM1BKWmRVTGQyNTVSbENmMnBmNW0v?=
 =?utf-8?B?a3doT3p1TDRlWDNUVVhoV3lvUkp0SDFyMllBelpCTGRTUzdtTm5KMWhQZ1Bm?=
 =?utf-8?B?emJ2YThLWmVROUZnUW1oSnoySjBxeGVsZnlNZkZzNE5GVld4RXYxVXJWYTl2?=
 =?utf-8?B?aE8yUkhERStFbkdpZGFRZ29paG5QMTJDbjRiZWZHUjlrdEhlK3VGdmdiTzZp?=
 =?utf-8?B?Tlk4dVVhNUdCWllaTC95dmtBQmNGLzRFaFR2SkxWLzNLSGwvMXFteFFkS1d0?=
 =?utf-8?B?T1VORnFDaG1xN1pUZUJqVm9KcFY5N1M1cFdWMHp3dmpHaFFVZzVTbzFISHFN?=
 =?utf-8?B?cTdmWEFIeDVRMUo0WDFjU0RJbmNqLzEvRlJleU55YkpSdlNEMXpvanJBRW4v?=
 =?utf-8?B?ZlVOZ1FyL3kydFlaRFZtV2ZNTXhVelk2c253UHA5MXJkeTlhZ1pQUEFEWHM2?=
 =?utf-8?B?VWhHaGNiWmF0SVBOSWdmSHR2Skt2bWJxd2I3bG5IWlJRcUJ1ZmRHVndINXZZ?=
 =?utf-8?B?WnVvelJXVWwrMExiais3WGRtT0U5SXFrYllFeUhsemJGQzNVWmlNRElmeE93?=
 =?utf-8?B?TVNTemZOU2hITmdjekkvTnFyUlJOaTZORWtvYVNsc3BkQncyNTQ5VlBKQ1Q0?=
 =?utf-8?B?Sm9PTE51TytoV0xKTCtSeHJDemRrV09ORHVJeGx4cVFtb3NkRlU0dUtRUVhM?=
 =?utf-8?B?VTJxbXhJa24zMEZrVndDejZrUXFRbThua0NsUXA5dkJDMDlHaklqbTM3cFhY?=
 =?utf-8?B?UnU4a0FUWE9FSURHM1c3SnY1Um4wWng1amRZWEprZWtqUU9waFM4SDNIVzg2?=
 =?utf-8?B?aHQ1K0g2czVRYmRRRkV1dlN2bW9KSm0relN2dG1iUHdwVmovSkcybC8wOFBG?=
 =?utf-8?B?bnV4Qk1CV0t4alRTck9oWU8wVmVodEJOYzJPeUZLTHhpSjRzS0syV0puREZT?=
 =?utf-8?B?OXhWMWN0dGVYNXN4Y1pxT0J4TlZLSXBNYXhsWVIzL3J4MWlOaERWQ2p0T1VF?=
 =?utf-8?B?UmFqa3FEZmdiRTk3SzRLUG16NUhLQVYzaWdtS29HL1FuK0dLUmVEbG1lYktM?=
 =?utf-8?B?SDBnRHBJY1FEMGFMa3NXZTVtQVBWTWRxM2hSTS8zejdueUdWMW5IeWJhanM0?=
 =?utf-8?B?K3Y0ZzdWeS83YXZXTkNUK0NvVllsK2xpUjBRYmVjbjFaSzVGRVhrbHo5ZXIw?=
 =?utf-8?B?T05YKzJqNjJoWlU5YWREUWpMMktqY1FJSmxiMUVCRDYrMkpMaGZmTWxYMXN2?=
 =?utf-8?B?ODRPYndDSzhLTk5adDR5K3ZmbWJKN0oyWUtjWVMyaWVDTndDWG94YVhFMW1s?=
 =?utf-8?B?eUs1N3NWL0xRMytpbU1lNEoyWTM1cHlwYmJlQ0tRQzBmZkMxNlBzTVgwb0JJ?=
 =?utf-8?B?RWRMNFpRbWV2TWxKZElRS1JPdklZc3NhMlVqbHVaZVpnTnR1VGtiTWF0VlJX?=
 =?utf-8?B?dFEzM1hHdEg3Z0FDdDFsdWx5cWtHc3RYSU5jWlhhU0JVdUMySlJVM3BZd1Jn?=
 =?utf-8?B?ekp4OFVnNjQxeTU3cWFDWi9nQ2FZVldaV1BGNWhySGdhU2VnemRsb0lyMWRx?=
 =?utf-8?B?RlNLbjk1Q0NtMTlCZGNxZUNXcFNuRUwvUVZEazd0b3hZUkhucDdxNkczMm5y?=
 =?utf-8?B?UDZMOEZOWml6cVNCNzNSY0tJM1hZSVRualJTVWtkZUdxMTkwNEhNU0h3bVY2?=
 =?utf-8?Q?h/hE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTM0SjQrV1c1NHVSV1Z4bXhZbm1Mc3VrcTNSckw3elhEclpXbEtZb1VuS0du?=
 =?utf-8?B?TjZ1SjZTeFpxZnR6TFZTcmxxclRHeXRwdzJjeTliL3ZuZFJNU0pXLzRLdVdM?=
 =?utf-8?B?VzQ0NXdNK3Z0NEhCbmpEcFZkdmtRM21qY2JZVk5YQ1dlbm04dDluWUNVdklK?=
 =?utf-8?B?dGpxa3g4eVcrU05LODY1TTN0bTlEUURLajlqbXFEK3VnVno3djZFZzhrRGVZ?=
 =?utf-8?B?ck9pRmg3QnV1TXZRUHlKTTZ6cmp2SGd3Y1k0d0xzcDhxRzA1QnQ4TE5wQ056?=
 =?utf-8?B?YmsyZjhld2hZZit3bFRPeUlWV2RxUldxRjZFalQyanhVME56Mm9xeFlQcGFM?=
 =?utf-8?B?Q0NVcXJMY0xTVmVNalVjMG53TWZKVkw3QVA1a0Rua0xYTFZjeUZqWE5TQURt?=
 =?utf-8?B?eVhDNUw2VFEvSTNDdVJ5SkhCMkFQK1p2QjRuZWJwNklwUjJDbkNvaFhqOHVN?=
 =?utf-8?B?SE1YOHZSSlBIZ01NeGRCN3c1SUczbkxVT09BSmd0bVpsRklMUHJKUDVDd0th?=
 =?utf-8?B?RXpHU0FFb25DblZ3WVA1ZmRmSE1mdm5ob2VGM0JoYTFKUTE4ZmEzN09UYk5M?=
 =?utf-8?B?SXo1MVlSdzBpaHkrTFFJcWJIVmVmVS9nbDYzazFGTlovaEZiWjU0NHMzSDM4?=
 =?utf-8?B?eTZGMHRPZ0NXeXpCek5QejBKRHF5Zk12RCtscTIyU1o5QjViaXlsMi9rSmdp?=
 =?utf-8?B?UmlXbUdxaWRFTnIvN2Z4TUR0UERsdXJSblJ2UEFZK3MzWm1PZ2F0YzRtWGRS?=
 =?utf-8?B?bjJBVjVLaXprSk42QkFmcU95MSttVWdLZXFXQXM5WWJPZVNkUmRFaGIvU0ox?=
 =?utf-8?B?TlBqTVJWT0Zvdm9ZSWFvbFpPMkw0c2R3b28vT0o2RlhYRU1mL3VjZ0RDaTJC?=
 =?utf-8?B?c283OVUzOHFHODRRRmZpU1doKytwNEZma05JUnppSkt5RTg5TmhSeEZ0U0py?=
 =?utf-8?B?eTUzM1NMVlBpejREOVI0eUFIcnFGT1M5bjFSMFFsMmRJNkNCM3NjM3JRejJF?=
 =?utf-8?B?U3NyeUxEUUk1Wkw0T0Y4N1dybENmbnVBU0lxOUJVM0JET0lTTnZVSnc0ZEZN?=
 =?utf-8?B?cEEyWEJsWDBoNjIyUGQ3dDBOZlhmSFYrMUhDVFpBWU5FUCtmYVdyNmxpakcx?=
 =?utf-8?B?MWJidndmNXluWDV1VnZtMTBONTdZV1A0WGV4Y1ppVGgvamV1akx0cWE3dkt3?=
 =?utf-8?B?WURqY0lFWmFuTnZBaDVJUkZuRytFclJYSUJwR0E2MUNVVms4SStJVkhtUEVw?=
 =?utf-8?B?RHo0ZlR2Y2pEWXk1ZlJPQkcrdTFpa0Evc0pmS00yQkpacHA0TllnQmVaSHpV?=
 =?utf-8?B?S1JnZ2dCVm5SZE1OeW1zNCtHNGdPWnN5aGl4K3Z3MFRSNEVTQkd1T25YOTln?=
 =?utf-8?B?c0ttZFdMbGFsR1hTME9OZlh3VFZmNGc3ckliUElRREdCWVhyMXlTbnl2YWNh?=
 =?utf-8?B?a2VVZjI0L1RRancxZGI4YnFyWmxuZTkxRXpvQlRqZTQ5Z05PN01zVGZ4SGx6?=
 =?utf-8?B?eXFFNmFFU055d04ySnNTUVdESHhGTVh0blhFZHljZWJPQ1lodEZ2bHZ1MG9R?=
 =?utf-8?B?VDZKZGVFREkwUzViTWlKWis1MG0zcnBqVm4zQlVNQU1FY01tcHBnQ1VENTFN?=
 =?utf-8?B?T1hDN3JFNXVKMmtOUkRNbHExMnMzdktxaTVGelJEMmlRWjNRclc0ZC96TTYy?=
 =?utf-8?B?cG94aHROR3Jaa2xmc0QrSHRQM1hGdkNhbWlZWCtTc3d3cDhZUmRORzA3dVk3?=
 =?utf-8?B?MHN5VWgybmNTc0NLVVdwWHJRTDVXQVoxL21IeWFEcGUrR01SQ29qRUZZLzNU?=
 =?utf-8?B?bi8yYWdGdEwrakdZWjliOUxNTWxsVzBvMlN5OVBMNTNHZVd2Q0V4cFpUN2s4?=
 =?utf-8?B?Vk9QLytiZ1JIWWprMjY0UTdibERYQnEwdGVWN242Tmoxa1lsWGV3Lzc0Mk5s?=
 =?utf-8?B?UFRveDdKOFFpMTdoai82SnlUWHFsVzNIVWE4SWwwWG9hQ2ZMMTlsdmwxRzVv?=
 =?utf-8?B?NHhVNXZVWlR2dzhyK0h5ODFxMGEvWGN6RittWDVMZ2JRMlFOazRQYzhHTlBF?=
 =?utf-8?B?VlJ3Y2RKQXVCVWM1azFZbkZzbk1KZlRHdXd5UWsrWWw5aVZCZ1NkUzY1YlhW?=
 =?utf-8?B?Sk9hZFVEaHN1OG1Cck4xMTdLM1ErU1M2VlhwRkU0eDhrdFdGNkUvQ051Qmo5?=
 =?utf-8?B?T3BFVEtaczFmR0NaaUR6ZkVycHNnNzhldEEyZm1HUFFOeWVsbFF1OGhyYWd6?=
 =?utf-8?B?bm05NmpwTVB2UnlpcER3MnpMOG90bmgvRjg1UXpkWmlrNDRGQW9RZzlpT2RH?=
 =?utf-8?B?LzNQWjY4U2VZbTh5aXUwdmdaVVNmVzZKK1Q3V3Jva2lrVWplMjRaS1lURm0w?=
 =?utf-8?Q?2Q89dp8CThZ25PeMyPyektKqAoaPZnTgnDYALuQm3vzqF?=
X-MS-Exchange-AntiSpam-MessageData-1: c/l9gu8sPwgvXg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a511fbbe-17f3-4547-21df-08de5b4b5814
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 13:20:29.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LLi8Brv0S2vkxc1MdVD3M5hDqZFkf8mCifQWBmd1uw7iiYtJoukSS05RuVTgn/FDFmGWnb5u+/G83nobFZJHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434

On Sat Jan 17, 2026 at 9:53 PM JST, Danilo Krummrich wrote:
> On Sat Jan 17, 2026 at 1:07 PM CET, Greg KH wrote:
>> Does clippy complain about this one?
>
> No, it does not.
>
>> I don't have strong feelings either, but the original is "easier" for
>> those of us used to C code.
>
> I think it's a matter of preference. Personally, I like those functional
> characteristics of Rust and the corresponding possibility of compact expr=
essions
> as long as it is not overdone.
>
> This case seems pretty simple though. :)

IIUC for this patch the consensus seems to be in favor of preserving the
original C-like style, but FWIW I found the new style proposed by Onur
easier to read.

I understand that it may not be intuitive unless one has some
familiarity with Rust, but it is a common way to write things in that
language and since it has graduated from its experimental status, it
doesn't seem judicious to me to artificially restrict its features.
