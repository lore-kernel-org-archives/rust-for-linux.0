Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020142.outbound.protection.outlook.com [52.101.195.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0842A1B2;
	Mon, 15 Dec 2025 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765803995; cv=fail; b=ebQvJIipnWlp9xzWeGnlXzB7IxOxrrMdhPYXVvGbzc2CWTgfh7Gz5k+BO1kHpjv6SAVqcYavkezIChdCHPEYQUpu1tY//n065d0lUFCq9t8d6dBz/bTFvHRceySTH9fvTsFXPEtIuWqZx54smGwlpAf3pOxCIAtPgfJ8xGV2U+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765803995; c=relaxed/simple;
	bh=OuzCMglzKL6QJaViHT9vOp0/qfAsixxZWEkLzsriqY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A2AgM+aswgWvIax4ygp3hSJx2q05vjvyL1LHcirESxmvXewLQuo2VyCjLbBoDpQXb4UVIuGc3kumDaHU4vAtBu4lpdKItTvxtqXB6BUZP688AEi0UoJlk0PP8VvjpDAmqvDpXz6u4OE/K11o5FVkbcZ3A57G5EwLpTnHjaxBdf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dxU9Gf02; arc=fail smtp.client-ip=52.101.195.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dxU9Gf02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISEEuburzU3U/ajyw57t867tiuERsfSTQ4J4ddLP8k2k8FRLXo0wTmHB0AF4RIFpq6Vdj7n1R6/iy3apfoI1H8mzZ0GeUH1KGnmWwHOxT1HNIQ+a0KxO7XTytrYN4c28V0Ihf+vDZm9HiLubD32JY0tgHwXwiyZGDlIsZ9vRCVubGR34amgbAR7kIyUsXukr7Zc88PJKOTXY7/nfw1NgTE7IgUmM58xHhCFFkgnzgEqcfWhePIkEuw7NnXxQIsFUtXlWdWyHQnKd1AZLVhI3RNqWWFFUyWCUxevo1M3Yr2bq2SicxPTh/2EKQwXYe34f1seYBmiDQ/AvI2fOv+hchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMnjvGTygwod4whBg3FkWOqTJYuGFE74YdDmKsgkO+c=;
 b=bn2c2gVs9FaQDOc0NJ8/er5oWWfKCK59YnD0NHKSfmi4/B61mPvzGob9jdIa2O2rYxw56qQl8gFrGUH+sjpIpSLTkPP6rATbOWvqrfZ4SHxbtlEGYk514lAHZ53i6Yj4Dpk2R2Yw9juHH7EGWwe4N6orukJjLivk9aa/4p7MlbqTwdlJpYV1WLhhRL5sewR4HUr/xi6NQrUQfnqgCyR0iC6abv5bKL/Hf7LLat3JMGsGRbSaMhIWrQ6S2UMKzOwCag4h8MGiMdHeEkiIfSALeIhmuCtMG8RRq3Da8g25Gykvtz3BKVqB4FbASNnC8F3q09KLT70QEtV7NVN9WRxOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMnjvGTygwod4whBg3FkWOqTJYuGFE74YdDmKsgkO+c=;
 b=dxU9Gf02JNdiKHaWDuV3XUXBhmvOaUvizme9pyLgBUcINPrVp6QGirs4YgAcPTZ6FAgIiB4tt5Hif6SEZlRr3lNXCFvOdSFacZJ3rh4/XKYiHWF4dbCC8lK3wBc88C3O+vSsMzVXSw7OT8q9dwAK+fDEY7x3SDRk78g855z1+ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7776.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:06:28 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 13:06:28 +0000
Date: Mon, 15 Dec 2025 13:06:25 +0000
From: Gary Guo <gary@garyguo.net>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] rust: add C wrappers for ww_mutex inline
 functions
Message-ID: <20251215130625.638f5cf0.gary@garyguo.net>
In-Reply-To: <20251201102855.4413-2-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
	<20251201102855.4413-2-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::10) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6ec609-527e-42f0-3eb9-08de3bdac22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzJLSENsNUU2UmN2a1g3NlJQRjk2ekMwMmROeXpMRVd3VUgzZERjVjhrd2J6?=
 =?utf-8?B?a0ZxcWRtUnZlVFhEUWJTQ2luNlpXRUhhUlhqcnloUkdxZXc4R2pMV1UyV1dZ?=
 =?utf-8?B?R2pvTHpFNjBsMUNKN0JRQ1czd3RUaDFsc0tYWEY4UFZCa25rZGhCYWhQOTVy?=
 =?utf-8?B?YkN3ZlhFUmtTK0ZMY3hWTE1vdVZ6V1lJdVBxYTZZaFJGZDM4YmJEQWtUcEEw?=
 =?utf-8?B?d0ZJM3NDQUwyZmttWWpSVHNkUkt4K2pNUFR4N0dUL3JuSjV6RDhUL1djZTRy?=
 =?utf-8?B?cWZubmhpWWNRQ0xVYjV1UmxBb2J6bWZUY1lHRnkrVzlWK1JMbDBKQndCUVBW?=
 =?utf-8?B?aEFlS01kOTNwMkIzVVFST1VTMXpiU2JDOFlYZUpFcUs4bVkzUlFOak03em9N?=
 =?utf-8?B?RVpQRUd1Y3JkMzA0VFFycWxUdDRYazJnKzYvb1BoVXRGU25nMUxFbnNEQ2Y5?=
 =?utf-8?B?SjJScXBUN2FpL3czeGF0SkhSNnhiWnBRdjNzZ04xNzFlS2ZKN2tybWNBQll1?=
 =?utf-8?B?T1llQW5HMUttUTA1Z0pHS2ZnSzNZUHdNcVdvalNuVXQzZlZZY2w4ZmdIeURv?=
 =?utf-8?B?dnFxQ0U0SUJ4NmkzYVFweUM2TFNNSGlxQzNTYXpibXRKZGJTdmQ4S1M1RUZ0?=
 =?utf-8?B?OU1Xa0tHeHI5NkhMRUVtQm9VeDlrV1FJTFVVcTJCTm9DbmtlODZOaTBmQTU5?=
 =?utf-8?B?aFRmcGhuSHEvaFE1c2JCcFJaVzFYVmt0VEwxakhIWERzc1NXWEZjYjY4RTV2?=
 =?utf-8?B?Vnpyc1JNeE5LeFlrZ01BemVPKzF0eTI4a2RqYm8rVGZXVWhIZm0wakkvMFhK?=
 =?utf-8?B?SjAxYTBrbFFqbFpLKys2a2RraUw2N2ZOSVhVR05rUjcrYVpZZytpUDE0QXk2?=
 =?utf-8?B?SUd1am1IOGdGcHVRd0Y0YkhpMkprSGRNVk5RTGtWVzV2K1dSMDgvNy9rKzdr?=
 =?utf-8?B?OUR2b2YrSlcrZTdnU1I3RFpDSlFhNGFVMUdEWUZRNGhqNFVYQ2wvS01EQUNw?=
 =?utf-8?B?NC92YkdEN2NSUjNsckxnQk1vcXJLdHo5S29qK080M0dKUUZmSWsrUnZuV04y?=
 =?utf-8?B?WkxuMCszU3lldUt3STcwYWFyem9LWW95VUt4a0Rmdy9RNVRUQ0g2UHF5aVVU?=
 =?utf-8?B?ci9NRzRoU2NSeW5TQXdsaHp5aWZlTHFVMGZ1dWVlNDFyb2wyVkRVMFY5Mjlr?=
 =?utf-8?B?RkRJbGJFMFRnZVlkRmFpcXlXSzB2TWVpczh5aTQycjZjVlV5SE11L1F2U01N?=
 =?utf-8?B?Sk9sK1dMdHlDMUNMdklFYkFiUm8va1Y3SFJTTVBKSXNCelNvYjV1QVhseEJJ?=
 =?utf-8?B?c3dCdGUzYnl1QkdxeCtaQ2JqRm4wQldxTzFveWF1ZXp1TU9LWWV3QmlMNThi?=
 =?utf-8?B?QVlGRktEMW9sa2tTN0FrMGF2ZFlwYStwZllIWStqaUdHQmRXc2tlK2t3NkFq?=
 =?utf-8?B?TE5pYWZuYW5LaEJqNGNDakZuMFhPd3hrQ0JxWHFKL3JUTnpsVitVZFRlOVBB?=
 =?utf-8?B?OWJxWDIwczlJV3VYRVc3N08rQjAyMmFFV3RhS3JrSCsxaTg1V01SS25tNGNZ?=
 =?utf-8?B?bVNXc3JTQjZONTNrODZsdy83U2cvMWNJK0VhbUg5Vm9GSlUwd3A0dkNIWjU2?=
 =?utf-8?B?Ri92VXk0aFM0SSs2TUc1b2todk9JVS9LU1NENGlHWnhFOHpSM1Mwbk9JQTZG?=
 =?utf-8?B?UGZWelRZLy85NGtpdmE2Mi9rL2Rkc2xMTFNTdmR6UmhTQTAvRWY0WUx5OHVY?=
 =?utf-8?B?WjVUVzN0QnljZ3kyY2JqSjM2czIvM3hVVzlwU0NNQW5vYlQzRzBFWExJMnkx?=
 =?utf-8?B?ZzBtYS9hMmF4NjhJY1dmaGlNaCtDVEhjUDk2ajA5Nzh4UU44Q21DNDNxRTgy?=
 =?utf-8?B?NkljclIrUXY5UUkwdVh6cU15cDArYkdkZTljbWhrR2N1WWdVNExGVEtobDFI?=
 =?utf-8?Q?bu6WZhf7GtQ8W/QUaDGA2JEFdpfTtXDm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlBBUVBrTllZRStWeTJra2szRFM5Wm5Kdno0d0pqUW84VnNvRkViVnd4YlZG?=
 =?utf-8?B?eG1lVVFBWEdNd1BsWUc4b3lsWkVzZkJnM29hQkxKSENRRWZqeVBNYmJiM296?=
 =?utf-8?B?aFJOblk1VXNzeEJSRzdwZXNzWXVIZDFFcE5OTTIvTDlvWWxrMUhYR2dBTXVT?=
 =?utf-8?B?N0FMMDFScE95OXUya2Z4LzVWa1luaGU4M3pvSDdRVCtOK2Y5aWVLaGdxZUNz?=
 =?utf-8?B?ODIvaCtqeWVRK29taFk2eUEvRVE4M1E2Vm10aHlpOWxwNEM4SUwrTTlGWVM3?=
 =?utf-8?B?SlhOOC9pYS9sVzVoNXFXbEpzWVUrRDZrRnJlbkQvMVJlSXVTRzdPSDhrazlz?=
 =?utf-8?B?QXViNUw2OG1rQTFxS3BNODVFd1Y1anJsT0h1Z1hmL0lLc0pOQ1ovbnRLdDY0?=
 =?utf-8?B?c1BhVi9VcVAyb0Z3VHVmU3ltU1o4RTFsYVFRdnpiQU9ZSHIwWkdVb0lRMnY4?=
 =?utf-8?B?MmdFRzBtVTduZFNhNUppczFMM1RXZ2U0ZXl4aUVHNHEvbDhHcWZERXBtdGJs?=
 =?utf-8?B?UTNqWnA3bVRzb2JRbVUxeGFtREZUTlE0NzF5TDlsRUgycXFjQy9HdWlSOUww?=
 =?utf-8?B?ZmNmcCs4czBOZlh4c1V0VWlwa2MzaU5hVlYxYXgvam9pN05keW5qY2dPdUNk?=
 =?utf-8?B?MjdMSE0vRmk5NVZBZFVURUt5Z0hIVFVJOUZzYkxtanlBa3Y1Nm1CR0JVdGtO?=
 =?utf-8?B?TEdja2FLenI5TkdINE1VdnlYVmJKbkZlbVp1MEVaYUsrNSt6SC9vSW1vQnl5?=
 =?utf-8?B?UVR1TnhOOXZMWi91cFdaTVRQNEtxRmsvM1NDNitzdWdVc0N2NUQ4U1FsbUtR?=
 =?utf-8?B?WDAzbkg4clErOHFlQzkycUU4VGpqQTdBWTdzckxJOVQzTURpdERRY1BlakNo?=
 =?utf-8?B?R0JySXJOalNKMTVIRXg4eHhZdERlZkhEVnBkNUt5OXh5czZQTkpScmtrVnpC?=
 =?utf-8?B?RnBjWjZEMmJpMDkwY3BYYXZIRWxBTkNTMWNYSjRrUG5tWVdhRFpsTlNRbjI1?=
 =?utf-8?B?TjZJMzFMdFdtQmdTdUdtc05JMzBsbGJxYjhzU0drT3BEVE5ST0ZieWo3SC85?=
 =?utf-8?B?MkorT0psSE9oOHZkTVNPa3liZWllRHg2Zk80MGVEVlZaVC9NWThKNFRoRXBt?=
 =?utf-8?B?d0RtUGY5cVRReExIcW5rUVF0dURNTU1iajdSY1VRbUhadXkzUGMxZWtsc0pL?=
 =?utf-8?B?MURTOG43RkJnQiswM00wM3VUMVh5VURvSTk1OXBqTDl1QVRuZFoxOEJ5K00w?=
 =?utf-8?B?QzdtMHBHdForQVhHQ0pMZGVhd0gxOEhUUHhXVFhRNXozQmNkaEprTmhBSHNW?=
 =?utf-8?B?ZStrSjZ3T0h6NUt3eUpWMWZIYkRkU3V0YnZsRk52UnRTRTQzNDBHNS9YZ2xM?=
 =?utf-8?B?bXp1ODd2RnlBU1hVcnhudmRHMXNsbXk1QldGM1puVXc1ZjNqZjlRRXVQcDRp?=
 =?utf-8?B?aG9ydVVyOGVGUjJLQld3VFlGbGQ3TlE0dkQ3d1FNVXBqTWQrK1puWkd5SzJV?=
 =?utf-8?B?ZVJNMlNDdnNDOWhBTkF2TkhIVzFXaHd0Vm4rM3Y3eGt5ZWVDMUsyb0Z4Q0pQ?=
 =?utf-8?B?L0cxakVGSUl4R0pZa2wybFJ2UlNWQml2eXJIdGFlTlhFRG10eFM5NGFwQjZB?=
 =?utf-8?B?MW5sN0lJZytmbHlrQXpxVFhRWjZSQ1lGVER1Q2RkN0RmNUxURjJUWXBydVNU?=
 =?utf-8?B?UjFEU2pFVnROeW52VWNNUUhia24zVXpTUW8zZFRqT0Fxb3l5VytVVkxDRTRo?=
 =?utf-8?B?eWx0QkpvNXVkVlVLY1g3Zllmc3VuRDVTUkwrVlBzNEdIMEsvM1gxbmUxQTVN?=
 =?utf-8?B?VFkvNHFJaFU4emxocFF0REV4OTFoTTVhd2hBSUZSa1VIc09UZG04L2pMSm83?=
 =?utf-8?B?YTd4L3VnK3JscldjazZIUWNEODRiMmJTcnA0SDhOQkNsMFZHcVY3SU03UGxy?=
 =?utf-8?B?eGtSSDVOeGJjd0dOeS9OYU0rZ1JkbUdSZnRGZGNaVGRWQ0E3Sm13d0ozS0RV?=
 =?utf-8?B?N2wzQ3Z6V3dqS3hmTFIvVzQ3MWFhWW01NysxdU1Pc0FvclV2OG9seUNOQ3p6?=
 =?utf-8?B?cVlsVUpUdnI0cU9OOW54bDlHczVvUjgzcGRSU0I5YTBJcVVWdWM0dUljUXNJ?=
 =?utf-8?B?cjVXM0Qza2hxd2ljWEN2aHJKbjVsY2FCdWp1eGZRc0RSdHBhQXBETDlLcnl1?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6ec609-527e-42f0-3eb9-08de3bdac22e
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:06:28.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd5xyv2QFuDqskPgj5SUY1yBCfqdBkMiYMteMFnSlPY0AobKM3pPD6BJ7nL65/GEM7HRCf6claPwD7PeOiwaoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7776

On Mon,  1 Dec 2025 13:28:50 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Some of the kernel's `ww_mutex` functions are implemented as
> `static inline`, so they are inaccessible from Rust as bindgen
> can't generate code on them. This patch provides C function wrappers
> around these inline implementations, so bindgen can see them and generate
> the corresponding Rust code.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  MAINTAINERS             |  1 +
>  rust/helpers/helpers.c  |  1 +
>  rust/helpers/ww_mutex.c | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 rust/helpers/ww_mutex.c
>=20
> [...]
>
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -59,4 +59,5 @@
>  #include "vmalloc.c"
>  #include "wait.c"
>  #include "workqueue.c"
> +#include "ww_mutex.c"
>  #include "xarray.c"
> diff --git a/rust/helpers/ww_mutex.c b/rust/helpers/ww_mutex.c
> new file mode 100644
> index 000000000000..61a487653394
> --- /dev/null
> +++ b/rust/helpers/ww_mutex.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ww_mutex.h>
> +
> +void rust_helper_ww_mutex_init(struct ww_mutex *lock, struct ww_class *w=
w_class)
> +{
> +	ww_mutex_init(lock, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_init(struct ww_acquire_ctx *ctx, struct ww_c=
lass *ww_class)
> +{
> +	ww_acquire_init(ctx, ww_class);
> +}
> +
> +void rust_helper_ww_acquire_done(struct ww_acquire_ctx *ctx)
> +{
> +	ww_acquire_done(ctx);
> +}
> +
> +void rust_helper_ww_acquire_fini(struct ww_acquire_ctx *ctx)
> +{
> +	ww_acquire_fini(ctx);
> +}
> +
> +void rust_helper_ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acq=
uire_ctx *ctx)
> +{
> +	ww_mutex_lock_slow(lock, ctx);
> +}
> +
> +int rust_helper_ww_mutex_lock_slow_interruptible(struct ww_mutex *lock, =
struct ww_acquire_ctx *ctx)
> +{
> +	return ww_mutex_lock_slow_interruptible(lock, ctx);
> +}
> +
> +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> +{
> +	return ww_mutex_is_locked(lock);
> +}
> +


Please include __rust_helper prefix in next version.

Best,
Gary

