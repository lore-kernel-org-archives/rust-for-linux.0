Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021108.outbound.protection.outlook.com [52.101.95.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E7F313534
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530241; cv=fail; b=kHw2pQs+k13IPGaY1mLiVu9jhHZ3V6AXK5LkoRR+doc6GFHYOX42NAsk4B8EFhCufzCSnir86ZWgcYQkbZ+g+Wosv3TW4mTybL9Q61PKDzh67thZq9y7TPxERdmaETP6fARCXsOSrtqyx1ivKtBDyw3Rnt0saLSW7oF8cY6m9iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530241; c=relaxed/simple;
	bh=0DiMmMk5xUEFneI19siCzR9wRtt4Z4aKCk40oW8Eb+s=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Xz8DJeVft2NR3TjhV+nDigLFf4W+U720LKxmj2FRh8Vk6NpHHtpwP7TB+Sf1y9wiLdWoUzslnTglAo3vWXp/jNrnm1jvb63Fl3LYWPC8wXmdeGWdGmNUmm2eZ5SwJjKWMU3O3X3444+0yXmpipXPrp4R67CyC22y9mlyuKsFPbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=N4x2AKH+; arc=fail smtp.client-ip=52.101.95.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="N4x2AKH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8z0c4sLDU86LugZAxNVrzqYJWJ0qWrLmupxllNypBL9iVgnhHJ4+Uq6wgN8voZ6Oj4/qHoq664oakxYU6U8c7gPIPkhKhz/mc/r6+W3HKC6GXob+8iTbcxvt5UL456z2K1NiFeYCTkeynJox7ti3j4aty8S4fhwnKOEFQi49cJRD1CQPU/xnKh544TN+o6eqfU49IEVSenHmEAajNuwGukXmXsuDhl+7smyaw4Plr+YqHJILkILRHBWdx0enGi23rIumB/U+SP07Br6zCMbszyZufM4hHgsGb1Q40YHEjRwNMLIfTWYDFT2j5/z7IrT4ptQvSPqDfI+HCPVt6t9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYuja83qqY2bSwL7TQW3QkYQG79v14SmSWSta95Tjtc=;
 b=pIlbPMz+8PmizrLo+F7NhGKfvxgJthJcGhV42WklRNV5OaxYKhKXEAcJn3XQ4l9K+cdJgd5ZnFGW1uPvi9DcUa/494uXcQnLLTp4Q1+DtNSS/mrjBKnwHM537zXvKox1fqFQE39l4QKgZ56OVyZay+aPl0t9DA5gd5TxBoKthVJiM7wf/G8LmU2k7H47eYM5EFYwcNsyCFL+skaMQryOQNjIdc31G0y9a9nyiuyS/2zwUEW1h3DZz1/app/Z4EvVjaW27ah4n5yU9nXh4hHmlowxNaQ3qB422Dl/ACpn9W+PbMWe0cY1zJHXbjuAKSPGGUbnx4EXIWAMTt28X0rCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYuja83qqY2bSwL7TQW3QkYQG79v14SmSWSta95Tjtc=;
 b=N4x2AKH+OdGuLPYqVlf3KjJjUn0eiY90Kpe/Gt5YfGPNJlliIsYwinvdJMpfKkqyt/U0wj7qAEki5dmlBT1RNhXXV+wPygDYNOFy7tzADrNC+ItizbJ6ag4eDczZtIvT08FoyxS560jNeNGCHDg1NfWZe3FlN0WWIzl9uQT0bkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO6P265MB6255.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 16:10:36 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 16:10:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 16:10:35 +0000
Message-Id: <DFZI47QW7VTE.1PF5P6LUTASVS@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "FUJITA Tomonori" <tomo@aliasing.net>, <ojeda@kernel.org>,
 <peterz@infradead.org>, <will@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
 <aXjbRq3Npqo7kr26@tardis.local> <DFZHIVE89VOW.1MQL8CO9K7SVI@garyguo.net>
 <aXjg4jv-3aQcy4O0@tardis.local>
In-Reply-To: <aXjg4jv-3aQcy4O0@tardis.local>
X-ClientProxiedBy: LO4P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::20) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO6P265MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: aa23be56-454c-4066-f10c-08de5dbe9aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWYvWGxSMyt2dEZqdkpMV1VxZWtKZlFGdFN0OTE2WmUyS0ZvaXpDTmxWaVpy?=
 =?utf-8?B?THRnZTFvTlNSYXMxUm1BNnA5bmJIU01qc3RSWWVoRHVLMHFiRE5iVVJ4dGlx?=
 =?utf-8?B?eElNTWVuOXpYbVBkRytJcUY1OHBzTWhUaHJlSGsxUmhXVnJOZS9CWHpZdlhN?=
 =?utf-8?B?RTQrTDd0Lzhjemd1YVltZm82S1AzNXIwZUVrMDlpQXJqSHVkeEpqRFlOOTgw?=
 =?utf-8?B?Zyt1eURRMm52cHBKMHZjYkIvZHRmK0R5eUExbXBzbklYWE94ekorN3RBdmZO?=
 =?utf-8?B?NUVHZHk4RUVpdFZnbVEraVFLczVUSjF2cHJXWndSZ0htRlBhMTNwSlkvajU4?=
 =?utf-8?B?djJsWXFKQnNLUG5lNE95cU9LZzFuWGR6bC95Z0ZCbDNNdnNBZ1ZONjlyK0xK?=
 =?utf-8?B?VlU1czRWN3RaZWJxK2NmcUFja09kdGE5VHlrMDNMSngyRmxSVGNBQ3lxVTQ1?=
 =?utf-8?B?UkovTmJVRTFMQ2tBZFAyUWNXVDNoZDZ0WGlJczhEMW1GYktxNUhwVmVqUm0x?=
 =?utf-8?B?cktsZGVsTkxOSk9pQjllZndRSW5ZMllnRmVScDFWM1lPMHd6cmZXOWdDaHpJ?=
 =?utf-8?B?NU1iVzA1L0tGOXc4TWN3TjFVcVZxNURMZ3RmYzk5ZnNDZ1lVMUpvb3FIM2Ir?=
 =?utf-8?B?QlpKM1dPeWd1SDdEbDBQWUpXaVFSSFFhaGN5MWNpd0FvNXlpREIwTm9xcmpr?=
 =?utf-8?B?Q1BpM0dyQVBSSXdlZ0VhNG9NOFo1SU9qYUZrOVBvcmJVOFZnVmVJS2pqTE11?=
 =?utf-8?B?YjFUSlJxc1BLYzFmUXZJS3FwZjZmY1dXZVhXWGw4ZHZQWFhTRkJ5M1IveXRK?=
 =?utf-8?B?NCtoMUE3V1h6MnpiZ20vZTdXU2ZQZG5jZUVOV2xkd0I1dU56K01sakwyRTVO?=
 =?utf-8?B?dlhMN0ZhdUhzZ1Ywejl1algycTNQa3RhRFk1QjZOQW9ubWZjSUxLM3RCNm1H?=
 =?utf-8?B?aUdGdWlPa0Y5OHJkcG5lRFBOZDdaSXpobko0T21sT2FrbjVpb3ZQVmV1VTJq?=
 =?utf-8?B?dFBnYjBSSXRzNytjN01qdjgwSUFXeXk2U2xMVE9SS3d0WElLbDhXaXBlN2hS?=
 =?utf-8?B?MlZSaUhZQ2M5R1ZhQm1NMGg4bWhPMXZSQ3JaYmo1RTdNQ0gzZGhhYXhhd014?=
 =?utf-8?B?U0VFY2g1bC9POHJSQTY0dE1tRXVPc09UaVRtelJjTllVSjVJYi9WUUZPWVl1?=
 =?utf-8?B?ZVE4S1k5ZjVoRnh6ankwQUx2R2tFd2hjSXRESy83L3BiTHJMRkdDbmcrUWVJ?=
 =?utf-8?B?aGtEYmtRc3UwZmJ0YkgvR0c0NStkZzN1bEJrRDA3bVlqSDk4c3Y4SGphNEI4?=
 =?utf-8?B?OHNvcnJBQmtxTWtKVldrN2VrMG44OTJ2WG1xSHROUHlYMDhENW1Xb084VHpU?=
 =?utf-8?B?cHVmOFNIL08xQVpZL0xQMGZmMXRncTFUSVluV3dSWDJGaDArMERMallOaFJQ?=
 =?utf-8?B?Ny9BUmJ5K0tRTXhPV0ladHROR2pVYkZUbkVwZTFZTjNGMTk1c0RTMFNscXVj?=
 =?utf-8?B?cXlCQmx1dHNLTmMyakJRSEtSWC9zWjhZeFlCc0xTNWlNdDZ5amNTMk4rK21M?=
 =?utf-8?B?RDNHdW9Uanh0WnVxVUJsRUYwZEZFTEZNOGVFMlNkaDYwMDBodVNwU0NvN2Rn?=
 =?utf-8?B?b2JtdHgxQW9XQXJ3cUVkKzR6ZCt3alVUbVdLY3RHVm52dmRRazZZWnMySWgr?=
 =?utf-8?B?R0tPUWpGaEZ5N1ZLdjRZbjZWanZxZUpiQ280YnNDREptR2N2UDI5c0NFakpO?=
 =?utf-8?B?cmRDWHRjdW9XazlpNXBSeDU3K3ZqNklOdVdWdjF3bXBZdWRDNXNRL0RkNXdl?=
 =?utf-8?B?VTZLeUNxZWVNbStXMnJSTVhLOFdORGVwVy9zaG0xNGd3S05aaENmWU9lK2JL?=
 =?utf-8?B?VWhkdVRMbHVWS1JPWVFNcjYxZ3NaZTlkek1CU3o1TndDdTlMd0crblB3dUU3?=
 =?utf-8?B?cnE0Z3AvY3NZcFBMZkFoL3R1K2Yyb25Wd0JRUE5nUE9lWGlIaWVZdjhmUTBE?=
 =?utf-8?B?cTViL1RTUCsxZVh3SmFLUWQ1SGZ5WktReUo4bEY0aFkvK1BGZHFmYUZLMWNZ?=
 =?utf-8?B?cWZkUEFIWmxEMkxYaHVqSGxSTWtkNlh1WWpDY1pUeGlNS1JvOFlaWWNEWmpI?=
 =?utf-8?Q?sQcA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVN0ZzNwVDZMNjltdmcwL3NEMkpVVDNjZlhucHE2SjU2U0VKV0t3VmJoY252?=
 =?utf-8?B?VnF6dmFPbXp5NFhPRlVUTzVsOXk5ODNNN0tEcjRrWCtIbUJMMG8vNGdKT2dU?=
 =?utf-8?B?MEkrTVl5Y3MxWGdlMkc2OElaUWlQWjBvTkgzekVlaTQxQ0NRbUdaTDYwVzVk?=
 =?utf-8?B?UmFGVzYySDhYZEtDTktPRkh6dS9iLzhOT0hQcTU4bEhtV3oxU0krR0FQYTRG?=
 =?utf-8?B?T1psdCtHUHNkWHozbkM4bEx6VzhzV1lYRFIvNUpDeXBta1Z3dXZnS2NUN3ZU?=
 =?utf-8?B?QTZ0TVhYYy9NU1dPZ2hwSXFNYWZVQ0o5N1VtSEZyWTg0VG1jWGRqTCtKKy92?=
 =?utf-8?B?TXgraUcvb1l6cytHb0hJSk9BczFOWGQvNzFrOTBaU2Z2NXZES2xCUHY3ZVNy?=
 =?utf-8?B?ZE00K3JtR0RuRXVwZVJONHBaM1lGU3ZkR0ZveWxVQ2QxUW51WGJDdmVpL1po?=
 =?utf-8?B?eXZmRkZseFpjUGd0L1BxWjdWWFV0SkZBWWVWMVU2M0c4TVNjTm5RYndpSng3?=
 =?utf-8?B?TG1JakVrRXY4Y2FMYVY2WkV2SGY2YTdIVG56QXlraklQTDZVQnE5c2ZsdGxs?=
 =?utf-8?B?SFdxeGhLeFA2Z014MGhQYmdNTXlHaFRGamVuTjJQMzQrWjNuM2VOS0tzVE96?=
 =?utf-8?B?V2lsamMyMmZrenV0bG0vcHhOVWFKdmxWOHZpK0dwOWk2S0d3MnBBa2dpOHNZ?=
 =?utf-8?B?MUZFS25YY3c3RWQ5cXByNVhNdDZ1bG9KNUtkY2Nscm9ERitDc3ZkZnZaS1U4?=
 =?utf-8?B?UWthWTV1Z2h5dGFuM2NNOHNGLzB0RUIwNFJpa0I5TFNoRXhYZlJpMFRGUHdq?=
 =?utf-8?B?R29OTUZMS0w4Z2dMME8vVTY0WlY4TFNvYU44MC9EYjRDOEJmMG43RG5ORnlV?=
 =?utf-8?B?R2hlUzBuVzE2TG5GQXozQ01BeUZvanN3NTUwUFo4WVFkbUVlNWtZcEo2NmFW?=
 =?utf-8?B?R3d1SVNrekdHd2FNSEpaWEV0QzY0RmRIcW1BY0dBZzhQeDkva3p0T2E1SUgy?=
 =?utf-8?B?bHBDcWVuckxQM2Q2VitjWVp6dHgwMXNhS1pGRFcrOEZQMHJydjdOY2EydGRk?=
 =?utf-8?B?eFBqRWxNYWRablU0OXFjNmV5RFBVR29YK0oxZlRGUW81dDBzT3orL1ozc0VG?=
 =?utf-8?B?dmkvbm92NC9IWnVERzBwbkJGM2E1OTBkV2EzSTJxNlU1V2JOVVplV0VhMG5w?=
 =?utf-8?B?NmQwUzE1OWFjZTdRQW5XYklleWFSc0ZxMnVtdFRlaVpqN3VhOUZDTkFWUGky?=
 =?utf-8?B?UHBPVW9abTZBUzVGZ2xOSmlNWlZnU0ZXeFhNM2s2dVBqem1HY1BxV293a2Qz?=
 =?utf-8?B?cERja2RZak9xWTZ0d2NGNDk3N3FSeVIyTTdnYjdTemtWNGNzcmFURG5Vb2h2?=
 =?utf-8?B?RXJUUWR6cTdMZnoraE5iWGVUUXJ5enRtVUQ5RHkyZGpkbFhGUlExVUJmYUFE?=
 =?utf-8?B?TFVoREJGNDJlSkVQL1pjREh3ZFdOK05zcCtnZTJNWVMwalgrUEFVYWNTZ0xm?=
 =?utf-8?B?TnB5SHN5WkhJMzIyZXFzUUQySUJscHU3QW1YT3RQazJUOVpKc2w4QWp6elFJ?=
 =?utf-8?B?VGxKZURTQWxZN0JqQkxqUUlvNGtXL3I4djc1OVBLMHk2aGNZL3VNd2FTYStO?=
 =?utf-8?B?VWM4Vmkyd3lOWVVIZUF3TVVycm5TeUxTcUdQbEtZQ3VRRHpNN0VTVlZxRkpR?=
 =?utf-8?B?VnJycjNmODFCYi8xYmVsdE9IU2FrRnA0NDFmZzlCbSt0cWQ5ajdtNWFnOHV3?=
 =?utf-8?B?NkpHQVp1Rm5qZzVXVzN5RWpYV05zTTkzTkZXSUJDL1RUdU9MekVQNjJtcUl5?=
 =?utf-8?B?cWs2MDBrRXhvbVc2WHB5aWVWbW5IeGh5YmppYXlCOWRuUDF6eHo5QjlSL3E5?=
 =?utf-8?B?UjAvb2Fqai9IWFVzV2l6ZExaMlNkTnRvN0tvZnJ2M0NhemJEVzBJMmhhK2M3?=
 =?utf-8?B?K0R4OU43UWJQOGU3SjdISEJqR05naUk2N1NrYUIwTk15Vnkyc3plTnRJdG9h?=
 =?utf-8?B?ODgvV1h0cUNJTXRxTms3MFFpK3JIQjVMTnl1VCs5TmxPM01nU29KZGZPamho?=
 =?utf-8?B?b2lUUWNubEVKZ3JNNmRXUWRNTTVPT1R5Q0dhZ0d3TEhBbGN2Q25TeXBKbkRB?=
 =?utf-8?B?MXBlelhKaXJNOFl1TEFFTXUvRURHbElPbHZ6cERVdTZMNlBrM1lNMCtWMS91?=
 =?utf-8?B?UFhPNytRdDhjMFlkTVprUndrV2FKb09GZkhwbVFvVGlSeVB2cHZqbzl4bVNC?=
 =?utf-8?B?Q014Nis0dmZFcGZmQ29TUlFtWXAweTU4R1hYUW5DSFRJMkM1UDYxZDBIK0Nz?=
 =?utf-8?B?dnUrUFpOaXFKbWsxb3dDVy9yd1lGck11aGVpSjRrbjBJZFR4QldiQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aa23be56-454c-4066-f10c-08de5dbe9aef
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:10:35.8841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL96uubapWDljuC9RMXkgzuoelLcfOXfTpEbvaXKxx2fa02L3YcAz7qYKlNZjbtnceYkvVG9l9gcPezaW+bTuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6255

On Tue Jan 27, 2026 at 3:59 PM GMT, Boqun Feng wrote:
> On Tue, Jan 27, 2026 at 03:42:42PM +0000, Gary Guo wrote:
>> On Tue Jan 27, 2026 at 3:35 PM GMT, Boqun Feng wrote:
>> > [For some unknown reasons, I cannot send my reply via gmail hence repl=
y
>> >  via kernel.org account, I might switch from gmail later on]
>> >
>> > On Tue, Jan 27, 2026 at 09:52:59PM +0900, FUJITA Tomonori wrote:
>> >> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >>=20
>> >> AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
>> >> Atomic<T>::get_mut().
>> >>=20
>> >> Also add kunit tests for AtomicFlag.
>> >>=20
>> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >> ---
>> >>  rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
>> >>  rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
>> >>  2 files changed, 37 insertions(+)
>> >>=20
>> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> >> index 6c46335bdb8c..b6c01d9f3a46 100644
>> >> --- a/rust/kernel/sync/atomic.rs
>> >> +++ b/rust/kernel/sync/atomic.rs
>> >> @@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxe=
d>(&self, b: bool, o: Ordering)
>> >>          self.0.store(b.into(), o)
>> >>      }
>> >> =20
>> >> +    /// Returns a mutable reference to the underlying flag as a `boo=
l`.
>> >> +    ///
>> >> +    /// This is safe because the mutable reference of the atomic fla=
g guarantees exclusive access.
>> >> +    pub fn get_mut(&mut self) -> &mut bool {
>> >> +        let byte_ptr =3D {
>> >> +            let ptr =3D self.0.as_ptr().cast::<u8>();
>> >> +            let offset =3D if cfg!(target_endian =3D "big") {
>> >> +                core::mem::size_of::<Flag>() - 1
>> >> +            } else {
>> >> +                0
>> >> +            };
>> >
>> > The idea is solid, but I want to avoid endian handling in the function=
,
>> > I would prefer a "struct declaration" solution like:
>> >
>> >     #[cfg(target_endian =3D "big")]
>> >     #[repr(align(4))]
>> >     pub(super) struct FlagInner {
>> >         _pad: [i8; 3],
>> > 	bool_field: bool,
>> >     }
>> >
>> >     #[cfg(target_endian =3D "little")]
>> >     #[repr(align(4))]
>> >     struct FlagInner {
>> > 	bool_field: bool,
>> >         _pad: [i8; 3],
>> >     }
>> >
>> > redefine `Flag` as `BoolFlag`
>> >
>> >     #[repr(i32)]
>> >     pub enum BoolFlag {
>> >         Clear =3D 0,
>> > 	Set =3D 1,
>> >     }
>> >
>> > and `Flag` becomes a union of `BoolFlag` and `FlagInner`:
>> >
>> >     /// # Invariants
>> >     /// `Flag` is either 0 or 1 in a i32 representation which implies
>> >     /// that `inner` is always valid as long as `_pad` stays 0.
>> >     pub union Flag {
>> >         pub(super) inner: FlagInner,
>> >         pub flag: BoolFlag,
>> >     }
>> >
>> >     // can static_assert that `Flag` and `BoolFlag` has the same
>> >     // alignement and size.
>> >
>> > then
>> >
>> >     impl AtomicFlag {
>> >         pub fn get_mut(&mut self) -> &mut bool {
>> > 	    let flag =3D self.0.get_mut(); // <- &mut Flag
>> >
>> >             // INVARIANTS: flag.inner._pad cannot be modified via the
>> > 	    // returned reference.
>> > 	    // SAFETY: Per type invariants, `flag.inner.bool_field` is
>> > 	    // always a valid bool.
>> > 	    unsafe { &mut flag.inner.bool_field }
>> > 	}
>> >     }
>> >
>> > Thoughts?
>> >
>> > Regards,
>> > Boqun
>>=20
>> I think we really need special handling for endianness for this one sing=
le
>> function, so doing all the extra stuff feels really unnecessary.
>>=20
>
> First, this one single function changes the design actually, previously
> you can even implement a Flag as:
>
>    enum Flag {
>        Clear =3D 6,
>        Set =3D 7,
>    }
>
> and it'll work, that is as long as `Flag` behaves like a bool, it's
> fine. But now this function implies there is actually a bool in `Flag`,
> which is kinda totally different.
>
> Besides, by using the current implement, we set an example about "how to
> do a byte offset in an i32 for different endians", and then if anyone
> wanted to do something similar, very likely they would copy-paste and
> modify what we have here. The potential tech debts are significant. So I
> would like to do it in a right way ("right" is probably subjective, but
> it comes from someone who needs to live with the code as a maintainer
> ;-) and I'm happy to switch to a better way if necessary).

I think what Fujita has is more "proper". Your approach still have the issu=
e of
requiring a specific ordering of the fields. If this is messed up, then the
entire thing is broken. I.e. the safety proof of `get_mut` depends on the f=
ields
being ordered correctly in `FlagInner`.

If you want to go down this route then I would just scrap `enum Flag` all
together and always define it as struct, with an internal `bool` + 3 bytes =
of
zero padding. This way we don't even need unsafe for `get_mut`.

Best,
Gary
>
> Hope this can explain why I want to do this right now.
>
> Regards,
> Boqun
>
>> I prefer Fujita's current version.
>>=20
>> Best,
>> Gary
>>=20
>> >
>> >> +
>> >> +            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes;=
 `offset` selects the LSB.
>> >> +            unsafe { ptr.add(offset) }
>> >> +        };
>> >> +
>> >> +        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and =
`bool` is `i8`-sized/aligned.
>> >> +        unsafe { &mut *byte_ptr.cast::<bool>() }
>> >> +    }
>> >> +
>> >>      /// Stores a value to the atomic flag and returns the previous v=
alue.
>> >>      #[inline(always)]
>> >>      pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ord=
ering) -> bool {
>> >> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/=
atomic/predefine.rs
>> >> index 11bc67ab70a3..e413b9e9fe21 100644
>> >> --- a/rust/kernel/sync/atomic/predefine.rs
>> >> +++ b/rust/kernel/sync/atomic/predefine.rs
>> >> @@ -351,6 +351,23 @@ fn atomic_bool_tests() {
>> >>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>> >>      }
>> >> =20
>> >> +    #[test]
>> >> +    fn atomic_flag_tests() {
>> >> +        let mut flag =3D AtomicFlag::new(false);
>> >> +
>> >> +        assert_eq!(false, flag.load(Relaxed));
>> >> +
>> >> +        *flag.get_mut() =3D true;
>> >> +        assert_eq!(true, flag.load(Relaxed));
>> >> +
>> >> +        assert_eq!(true, flag.xchg(false, Relaxed));
>> >> +        assert_eq!(false, flag.load(Relaxed));
>> >> +
>> >> +        *flag.get_mut() =3D true;
>> >> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
>> >> +        assert_eq!(false, flag.load(Relaxed));
>> >> +    }
>> >> +
>> >>      #[test]
>> >>      fn atomic_ptr_tests() {
>> >>          let mut v =3D 42;
>> >> --=20
>> >> 2.43.0
>> >>=20
>>=20

