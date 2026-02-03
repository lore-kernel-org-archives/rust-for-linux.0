Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020115.outbound.protection.outlook.com [52.101.196.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5748346797;
	Tue,  3 Feb 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123593; cv=fail; b=LQssTNBhZBbx9gjSsJSNa+NG0ol5MpTtN8c+Edk0mg7GSui0y2PRfv95pjn4XqvE7KQbstwvP1izzrIeYdlGs+iBM+4NTycwfWum3g7j74K1XPQiH4+ZqsQC82yEhPttytxn4g7/Fn2T314KMHBqhfjKK71ngLF5luk0vuV1+G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123593; c=relaxed/simple;
	bh=zgW89T42rta9chQBc9W+KjQ5r3D7BfBRZoMksYvFqX4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nd0Y+ubHtlyjcjdd1BHccGDriNul5msYFp9bILx4BG1iS2y0wOq4U6RUSoBngXrC2+DAc7+JqDNYDHLShU1XIVDNHGu8767A+lnjo6pb5UE4JX/nwl1SY3jOIH79Fiw6RYfzzU6iKj8SnF/IZQ5wsaOOYIy5CYbwhkz0EHMnpek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jnf6P240; arc=fail smtp.client-ip=52.101.196.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jnf6P240"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmXZiVb4asfNdQ2R3zHhn2vM5gdX4pQljPFuYkKx7o7vvR1Zsgq+28os0h0yw5fvQYgkmEWa1MnFnMNcIuFA29LKpeOs1HKyAjPYRp9JvqGmURbD2vaM356VUXtwtrpn8WRT+4GiI10XiqRHMybbsmTEFCrbTxZ3NDy5hnlFt+KWBBnQTmn0J8YFc/1zvyLWtrRdgkxCQ0XWucw3FcKk8feKEz6pKMdKzwgdm8l9NKnUgQa3Z9CGNkddzfCWbdE4VTy7WNQlmfrV2PLzeXdDwfR1jjeFdvVlUJoRVhp/5Ov7VcVmbVQeMQ34NeAJZde3z7MgaenF13ZhCr22telE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzRZE4PUYN2UGhgMyssyzuKU0WRP0uVkkwTYj8+Fukw=;
 b=FC97LSTUvugtwAWj51/slobXPfaXvtnMxqdGSaLJDnwBFZ7HWyxbBIM4RJiNxnpjxoVIkzHNs42FtT69g1fJuiRmO52L5yr33ypAca1a4zOT4z+ukd2UbXnwkC8a3CJ+ybWerFJeOgbIgN5rF/OrdeXjYlitfwLxeBEfTc3ZSAgjKlFK7h3oAk5GiSb0oKtc1CCddmjl8CLeqYG3xiEtldtyRrDzrEoRUemffY1xei5fY7HcfEBPg/iu9nL8+ZdxbIwA/KpRGmMtaQplmb/nYpQ+sDUO/XaWYhZly2/ECXIydpnwJmmAG6GCMuhgvZh1hmTjF8Oo676XlXZSM/+Pwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzRZE4PUYN2UGhgMyssyzuKU0WRP0uVkkwTYj8+Fukw=;
 b=jnf6P240FF1xUf+qCfOOsV9/Ic9CePaQYPEZfx2HdQB4u1C6DyjqpbvdKRJn2Wmfw5IkxWv6Ut14L5U9bTijC4+nXa3UTFXZSVqL0VbWpiSedTYHJ97k5hCPQ8l5FqFcWJxHumovZvCFYWxxc1klcaUyPYv1AQ6tkvHGY0byDvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5737.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Tue, 3 Feb
 2026 12:59:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 12:59:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 12:59:45 +0000
Message-Id: <DG5CFX3ML5YL.2FE913F20LNPT@garyguo.net>
Cc: <heesu0025.kim@lge.com>, <ht.hong@lge.com>, <jungsu.hwang@lge.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <sanghun.lee@lge.com>,
 <seulgi.lee@lge.com>, <sunghoon.kim@lge.com>
Subject: Re: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for
 freeze operation
From: "Gary Guo" <gary@garyguo.net>
To: <jongan.kim@lge.com>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <arve@android.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
 <brauner@kernel.org>, <cmllamas@google.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <tamird@gmail.com>, <tkjos@android.com>,
 <tmgross@umich.edu>, <viresh.kumar@linaro.org>, <vitaly.wool@konsulko.se>,
 <yury.norov@gmail.com>, <lossin@kernel.org>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203065928.4736-1-jongan.kim@lge.com>
 <20260203065928.4736-4-jongan.kim@lge.com>
In-Reply-To: <20260203065928.4736-4-jongan.kim@lge.com>
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 0343ccb0-4c40-4ccc-4f04-08de63241b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlRVKzI1YkhJQllXOEFhUGZmdis4aTYyQmlIRWpHQTNpYTlaMHZtc1FwRnNi?=
 =?utf-8?B?NkVtWVNxdG12ZEhRSSt3Q2ZLSWpJUkx2WVkyVWZuOE5TUTFiWnRycnVtc1Ar?=
 =?utf-8?B?T1lNMXh3TzVsLzBweHhSYmtZSzZIS2RkR0NBOWJBMVk4RXdpQ2hRUmNxTVZo?=
 =?utf-8?B?d3NpL2Y2RFhxd1NtUFA5cDZoMndBdS9CTFRvN3JNWEpPcU1zMzhlRjZrSnYz?=
 =?utf-8?B?b3JBTTFnS0t4QTJqTExuZHphTFZ5L0RkTnBEd2pHVWxNcndjZGwxQ0lpSkdj?=
 =?utf-8?B?VTJ0Vi81bk9pbWJNcjJOSUFHdU1LOGt0b0EyK3VubSswZFYxMlp3S0I0YWs2?=
 =?utf-8?B?Uk1nT09kcWpEK08rMjlmV21oS0VqbVV1NllIU0RHMEwybmNURVpMVzBabUNj?=
 =?utf-8?B?bzgwZHJnOHFNR1V5RWE0Sjh5ODJpbk1VR0dZbGRnWG1nMHZ4dUUyaWpIVEZM?=
 =?utf-8?B?UUQ2ZTRRaGl5M1hJSWVmVmE0ZnFYZUNKeDhxcmhiNkdPTDR3R1ZJT1IvZ0Jr?=
 =?utf-8?B?ODVyaVpCWE1vVDZwcFN0NzV2dnp0UURSb0krc1RTWW9FdDVIVkxvbTNUalRT?=
 =?utf-8?B?MmZCdWhxdzVuTUZMOXMvZ3pkUEMwV2lNcmJRV25HWmxMSy9jZXppbGNJZmxi?=
 =?utf-8?B?NHFWY1lWUjJ5K3lJMm4ybmRNUTJRRkptYkNybW9ocVh2ZklnVlM3VmZsbFdl?=
 =?utf-8?B?T1UzMVZTT3lZYWVtbkZDRFd5Tmlsb0kwWVJlOVQwTkNTNEJSZ0VPNVlCMkdu?=
 =?utf-8?B?aU8ydDJ4cDVwRUtOSXloT2lNeG5ydTYzaXQxamhFREhZVGRxR2NNTThtcnU5?=
 =?utf-8?B?NEFqQzhGai9YZ2pYZzMySEVLZ3FVOEg4YUVwQzN4aDUzNjdqcHNMZnNxVE1B?=
 =?utf-8?B?Zy9CMENrbE0wbHFLazBsb0tnZXcvS3lGZ0NNNFJhK0o1OS9OY2pxM0F2dUdJ?=
 =?utf-8?B?ZXFMRTFINDBRek1VT0x3bVV6cGZPblpZazRoSnp6ZGcwbkk1RlNSNWc5aDd2?=
 =?utf-8?B?S1JVL1djendodjA4WjhHckxDaGQ2WHpzTXQ2d1EzaWlRUUlIbFk4K3loSjUv?=
 =?utf-8?B?T0xIK25xUERhTCs4eW1lNXBITWNtcFhqVHVLcWhPc1gvZHVwZDZoTkp5Ykw5?=
 =?utf-8?B?K3Zib0E0MGpKN1kzRU5JaHEvaUI4d1U5QitPdzFTdXNuTkwxSG1LSzRKU3dJ?=
 =?utf-8?B?ZktMaGRYRW4vRktBSnB6QzY2bmVoVHgxVmpIb3NQdm53dzllNG5uRFo1Y2p0?=
 =?utf-8?B?cVpxbWtoYVBMS0xETklDOVdyczBzWXo1bmNieDVLQnd6c0NCWEc4QVpIMGJq?=
 =?utf-8?B?NW5US2Y0R3hUS04wVFdOcVVCa0NtWjY2dUhXTmlTL0lJYzQrODc3akRTWmxT?=
 =?utf-8?B?eW9Tb1k5aG45cVpWZ01CN3BHUmdUbjFrQUxVYTRnOTdKc1NDMUMrdHBxN2R6?=
 =?utf-8?B?Y1RsdDVYUCs5ZlpUQTZFN2hNR25NQjQzbFYxSDJjZm4xTlFBeEE1bURQdUZs?=
 =?utf-8?B?Z0FrakFlSXBPVUZ0Z0xNa3Rta0kyWnR1QzJuTE12KytucHJaNHdsREdKQnRZ?=
 =?utf-8?B?VU9GU0JmUHpMVWtiN3ZQdnY2ZVJhZDRFbXh2SU1QN1hEWGRPcmFCQ0R6dG9s?=
 =?utf-8?B?d1kwcXRnOEJrREVzZHlPL3BKOTZxRzJwYVFvUEZhV2YyMTlyYm5VOTdMR1Zm?=
 =?utf-8?B?dFkyTStXSzVUYVNvTmp5VFVYN0g2dXZvOE1nNkN2cXgxdDh5VUpULytyMXY3?=
 =?utf-8?B?cGIyU0ZCdG9qcGJOdmkxK2Y3cm8zOEVtS1Jsd21wNHcvMDZYL0Q3K1RBMWh3?=
 =?utf-8?B?Y3pMbnd5VjhQRU5MMW4wSmorNTliVmRoOTZBMzE5ZHVnQWdPTHpZbjZpK2hS?=
 =?utf-8?B?OW5IYVhQOStydDV3N0V6OWo2b2pUQzVySS9SS2ltYVJpSlJILzdhMXE0cnFK?=
 =?utf-8?B?akZUejNDeUlKOEFaTTdhRWUwWXowbFBtOXZaS1d2WTQ1TXY2bzRQM1lRR3VL?=
 =?utf-8?B?Nk41MDU2T3BEYjZlaFJFSHlUQkxyd0hhenh1WFdJbVNQY2VEc2JsTmpzSjgr?=
 =?utf-8?B?ZHZnZWdsMllkN1ZHdHVSR0NSdUVvalZRd0xVQ3ZSa29EaFRMMVlZelhaSkd6?=
 =?utf-8?B?U3BuNktoRjIzckdxMVRNTXBMRzIwUlJvVEl5QlNERU4yemVhd1lkc2pPMnVF?=
 =?utf-8?B?UFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzAySEdCN09hQ0RLK0cwenJhSTlwY1d0TWNHWlFlM29NalZ6TUI1dVVzL2Vz?=
 =?utf-8?B?NDVPZlo1NGJlRzIzZUVmNTZYT2lhejkwVjJocGdkM0FRcERsU3lWRnIrQytW?=
 =?utf-8?B?bWVLWUtEVTdVUFJ0cXUvUGxQcXdiN0xlN21KQ0VrT0RXc0g0cU16UjhPRDJG?=
 =?utf-8?B?WGNPM3ExazlSbTBWU2pzL3AzZElMVlN1aDNibFY5cTZzUnhyb0srR1dLRDBs?=
 =?utf-8?B?cTRsazQrang2S2k0TDczSHFVQkRUTHdUcE1IRzh0Y0N6RWxFNG5Hd29NSnhS?=
 =?utf-8?B?bFgvOSt2VmlMYVpiR3diV0NkRDdhWTlIM2VBMUZKUHJyUkxXc0tkdXFxd0dM?=
 =?utf-8?B?Y3RaU0V5a1JlY3dvc0NCaHRCSkpUVkZ3ZGQrcHpQOHB5dlFML1B0Wi84SWk2?=
 =?utf-8?B?Wm5Ma3AwSVhvU0FMT1dvUXFXdk9ZR2QybFpYdUtyekxxTG9LZGpNdW55WnZ0?=
 =?utf-8?B?ZnlXNHgzL1FnWnRrZFJySXJoNnB5U1lXcjZFTXN1U29XOTkyQWllMFhoWGZN?=
 =?utf-8?B?OUtBU0FGekswbGNqVFBYQWFFVHR4N1hnYXorTzlSWVhhUUpueEFpTXpJZ291?=
 =?utf-8?B?OXVDVXp5L3dJdmUyRHdzbnUremhmS1o5MXVwdTBEOTBnSWR2d01PV0ZWSXBw?=
 =?utf-8?B?TWhSdGtnVmowZU80WmFnMnEvdW1iVTZEaGkxMmxzOERaeG82c3hBNnU4SGtD?=
 =?utf-8?B?VWxoeTVQNHYyVEhyTTZMcGdrb0tFUnU3U3lDQ01qL2IrZCsyM0h4M0FDa2ZJ?=
 =?utf-8?B?MDk2WEVaZjFsV1o2bHZGZ3pneEVaelZIdFd1ZTFJSTJjN1FCSDE1cFQ2VGE3?=
 =?utf-8?B?SXhTNmp6N1JVM1FGc2V4d0F2QjQxUWNzYWQ2eldzd29CRnY0UGR2T1pZMGt5?=
 =?utf-8?B?Rmd5UUdXR25MZ1UxQVpIMEVGUDd1VERXMkZaYjcvT3Z1OTlnMm04QnlvUTBQ?=
 =?utf-8?B?a2pwTWlmNWkwWVdBNHh2WGd6RVk4YWpkYlJMMW5XeVNacDIrT0lhSXVBY1JN?=
 =?utf-8?B?c2w3aEMwY1NjSWFJYU90L1lQa2NrcEgyeVl3RXdLRHV0TmgxL0JKcnRnbzVD?=
 =?utf-8?B?VmdwbC9iWFZrVk9PcVVnWndUSnJCbmxWMm9TbkdNMnM2M0kzZXdJbTVHRkRZ?=
 =?utf-8?B?dXJkNmQyZ3NCMXE4SGwyWUFQcDN5a2tqY0NjOHRFWnIvajBqVGVhR3QrV3RB?=
 =?utf-8?B?UDBLaHF4TjdtV2w3cUNLaUZqTk9YL1czUW1GZzBsU3FVRXhkc2lNMi9QRnk0?=
 =?utf-8?B?eFBpZzl2YkFLaitUend2QU1waGZuaTQ5NE84RmFhRS9KZGI4YmpEZGN6QnY0?=
 =?utf-8?B?Zk5ScVNubzk1NFRzSitMRkUybzNpa0JROHVHYmh6WW5pelQ1Z1FDM0t6Vm1V?=
 =?utf-8?B?Qy8wRURaOFhIckkvWVVRUHNOS2Q2S1ZneEpVRENYYWlBaGVGSlY3Nm5EcE5N?=
 =?utf-8?B?WnQvR2RUUnYrTU0xWHNZL3lqN2hYMFlyUXhuS3JDRjljWGYySHU2NmM3eC82?=
 =?utf-8?B?R1VXcVI5R2s1WkNvTmhSN1pjckx3NWtPNC9vcFNwRnY3eW5OY2FVQUJkTm5J?=
 =?utf-8?B?d2RsbklWa0ROZmNmUW5WeGcxd3ZWZTZ2bWdjZ080T2VlRmc1UEdBWTRFN3BT?=
 =?utf-8?B?SXlCSHZvMTZackg5dGl2a2dlVjZUai8zaFZibDBReGlyb2N1bXRyZEk3d2h4?=
 =?utf-8?B?eXdNQlVQQTVtWURUSWtjeWRJdzdRWnljbDl3K2xZUlN3aEJ0bSs1ekF1UzdE?=
 =?utf-8?B?aXcxS3VVbnlXMmt0bS9UM2QyTlpXY1RoN1RRN29YcUNqbDdIOHdhYVdZNmNF?=
 =?utf-8?B?ZGNtMXQ5WFZhclkzMllWbURFZ2s4KzJDd3NJd1B1eGVldDhiZE1QVnh3NXBl?=
 =?utf-8?B?dk9HZzBMTFgvNFVVNWZ0dG9NMmhhcTZRSGo4TnNTTDZubWFva1VOQkxaWFNw?=
 =?utf-8?B?MVc0SGxjZ3VHYzFoNWVIRFMzOStUM2U3YWphR3BkekY2eVpITXM1Rk82OXJG?=
 =?utf-8?B?K0xmNC9ycHdSb3RLMjdJMDYxZzROZnlZWGZ3UmxXZ3JObFROc2xReHh3NDAy?=
 =?utf-8?B?cVh6UFZ4Rm1ub29wWWFzdVBKTU15aGhtRWRQUTNNNWxyUnVSTVU3dUFzM0xU?=
 =?utf-8?B?SVlTNW1jYWlDTHQyN1liMXUyd1BjWjJ4b2lFakxMMVNHUFl3RkJFazc0M3NW?=
 =?utf-8?B?ckpxYURZOURYN2tqclFVSGxvYmkxd04zVUZ0ZjU1V0FCVC9QVXNTTEtYaUlm?=
 =?utf-8?B?ZVNEdHpDNk5rcGMwVjZ4WnBvbzh4dTNuYnB0UFlMNHQ5L2ovYmlkcGNaV1Nv?=
 =?utf-8?B?a3pGMEc1VzlLZVlhRlhPelJsSEN5SmZLZ1BjYUhqSVlTaTVlWTlUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0343ccb0-4c40-4ccc-4f04-08de63241b62
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 12:59:46.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHs8o3MnLUa39oNp7qBjhY829izAZ0Z0Q617jHTWtZPQutnw+KiQSFw4/iFj/d1l5PFuTGqvHhXRtF4eB/l3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5737

On Tue Feb 3, 2026 at 6:59 AM GMT, jongan.kim wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
>
> Port PID namespace conversion logic from C binder to the Rust
> implementation.
>
> Without namespace conversion, freeze operations from non-init namespaces
> can match wrong processes due to PID collision. This adds proper
> conversion to ensure freeze operations target the correct process.
>
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> ---
> v2 -> v3:
> - Use task::Pid typedef instead of u32/i32
> - Use PidNamespace::init_ns() instead of init_pid_ns()=20
> - Compare PidNamespace directly with =3D=3D instead of raw pointers
> - Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
> - Fix rustfmt import ordering (rcu before Arc)
> - Rename TaskPid alias to PidT for clearer pid_t type indication
> - Use task.group_leader().pid() instead of tgid_nr_ns() for consistency w=
ith C
>
>  drivers/android/binder/process.rs | 37 +++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index 132055b4790f..ea30bfac2e0b 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -22,6 +22,8 @@
>      id_pool::IdPool,
>      list::{List, ListArc, ListArcField, ListLinks},
>      mm,
> +    pid::Pid,
> +    pid_namespace::PidNamespace,
>      prelude::*,
>      rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
>      seq_file::SeqFile,
> @@ -29,9 +31,9 @@
>      sync::poll::PollTable,
>      sync::{
>          lock::{spinlock::SpinLockBackend, Guard},
> -        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, =
UniqueArc,
> +        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinL=
ock, UniqueArc,
>      },
> -    task::Task,
> +    task::{Pid as PidT, Task},
>      types::ARef,
>      uaccess::{UserSlice, UserSliceReader},
>      uapi,
> @@ -1498,17 +1500,42 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFr=
eezeInfo) -> Result {
>      }
>  }
> =20
> +/// Convert a PID from the current namespace to the global (init) namesp=
ace.
> +fn convert_to_init_ns_tgid(pid: PidT) -> Result<PidT> {
> +    let current =3D kernel::current!();
> +    let init_ns =3D PidNamespace::init_ns();
> +
> +    if current.active_pid_ns() =3D=3D Some(init_ns) {
> +        // Already in init namespace.
> +        return Ok(pid);
> +    }
> +
> +    if pid =3D=3D 0 {
> +        return Err(EINVAL);
> +    }
> +
> +    let rcu_guard =3D rcu::read_lock();
> +
> +    let pid_struct =3D Pid::find_vpid(pid, &rcu_guard).ok_or(ESRCH)?;
> +    let task =3D pid_struct.pid_task(&rcu_guard).ok_or(ESRCH)?;
> +
> +    Ok(task.group_leader().pid())
> +}
> +
>  fn get_frozen_status(data: UserSlice) -> Result {
>      let (mut reader, mut writer) =3D data.reader_writer();
> =20
>      let mut info =3D reader.read::<BinderFrozenStatusInfo>()?;
> +
> +    let init_ns_pid =3D convert_to_init_ns_tgid(info.pid as PidT)?;
> +
>      info.sync_recv =3D 0;
>      info.async_recv =3D 0;
>      let mut found =3D false;
> =20
>      for ctx in crate::context::get_all_contexts()? {
>          ctx.for_each_proc(|proc| {
> -            if proc.task.pid() =3D=3D info.pid as _ {
> +            if proc.task.pid() =3D=3D init_ns_pid as _ {
>                  found =3D true;
>                  let inner =3D proc.inner.lock();
>                  let txns_pending =3D inner.txns_pending_locked();
> @@ -1530,13 +1557,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
>  fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
>      let info =3D reader.read::<BinderFreezeInfo>()?;
> =20
> +    let init_ns_pid =3D convert_to_init_ns_tgid(info.pid as PidT)?;
> +
>      // Very unlikely for there to be more than 3, since a process normal=
ly uses at most binder and
>      // hwbinder.
>      let mut procs =3D KVec::with_capacity(3, GFP_KERNEL)?;
> =20
>      let ctxs =3D crate::context::get_all_contexts()?;
>      for ctx in ctxs {
> -        for proc in ctx.get_procs_with_pid(info.pid as i32)? {
> +        for proc in ctx.get_procs_with_pid(init_ns_pid)? {

I think this function already has `ARef<Task>` for all the process, so it f=
eels
to me that the search should be simply based on task, rather than PID.

I.e. instead of pid_t -> struct pid -> struct tasks -> pid_t and then searc=
h
with it, we first get `Task` from VPID, and then search directly with it. T=
his
would also make it no longer necessary to have the init namespace check.

(BTW, the current impl looks quite inefficient, get_procs_with_pid returns =
a vec
which is pushed again to a vec, perhaps using a callback or simply passing =
in a
`&mut Vec` is better?)

Best,
Gary

>              procs.push(proc, GFP_KERNEL)?;
>          }
>      }

