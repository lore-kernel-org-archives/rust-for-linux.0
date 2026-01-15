Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021113.outbound.protection.outlook.com [52.101.95.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6939449C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483368; cv=fail; b=g2Tm4LtKPvJd4WFeTrEZKDTe9GJehg34vXvAywpBqrTlhtSdPT7lnHieG30N/dTGZH5z5AkOfnzWrVHEFOejpSYFWXIfZfI+STMRPQMNMvgcgP0jsEVgEwrLWKF9ks7GRfTbkP+55Xsg6G86mWWpshQ6N9jfWlZ06b0P/wyZGoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483368; c=relaxed/simple;
	bh=3twhDiro0pdxHbYHY8Od4dDgtrr9z504Co8YwMGIihc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nJVfF4FBbj70hCiulapAlEZaAml/83fzaH7lZp8DcG+aWj0vpSBxZMnMvFaKbZMTuw2ucoqLU5L9G/l/SrKqLygeViRZY3luxq2V4W/Mcu6aTZlf8KKZbcA/MgYHu62XRAm+1dSTBIAQC/+TsZczUalmAKtsYHul8WTELRecm48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uCJXAoQv; arc=fail smtp.client-ip=52.101.95.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uCJXAoQv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZONTY2wATeQQ5OuWkl4xoPMUg6gA5k6YQ9SAh+YYvlP/sDqt0hDZaY2DdFEo+amxjSij4y/I5NkCRs1FmNt93mH/HHcvgI+6cbGRs7IuLSh71XcVb9IoF6XuO+IsahLPmsGBbkS1Y+Q7u5q3OZTmRzm8/wWmJV9wap6VGHyBs/03lKoYWntiS+AVgLs5z5jN9AhA17YX5T7hSFW1zv8uWndQLGqWv5SWN+PZp6KjBg41r1yhELD9ljJPjYkXeoreGnkJzcfZ8Wri4b0ZmQnXTzHCUnBHd1HEEsZhkDa6qeJE+xLCBzrVpUokOZKhKZx1eEn1k40LUijsSGZKtOO3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5g+chGhG7xfv3hkh4aeNTYkS8CoyIyqKeKaD95OhAU0=;
 b=XOaZ0Pr7hDL1RGAqoFIjz0cS1AB8V+zgmKSMzjKm03v3FBjOVkGqyl+fhdRX8mWpyse5fS/1j3+l1INnf9oGKJSQLJZSGbF6aAeayu9yoMKRuleqQ4bARaDx4xZVAQWWKxSdOx7SVVcVLdqDLXi+ofXKZPzMA/PPLRycH0iODTj4uJZC23hYoboD/eWcrrw9h3wOB+xJ5NSjYcFSTKjDHEM90rttRhmN7nqYj4/p1LROAaQLw7vhsXLy3Vc+/v5lZz1l+GC2of0AjzIcL5a61jGkZv7q3f8uM70DnaVu+LpwZvHGGMgErgxi8+a2rPX6i6X2FxNWhbwuNeACAPz0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5g+chGhG7xfv3hkh4aeNTYkS8CoyIyqKeKaD95OhAU0=;
 b=uCJXAoQvpAdaGe4w4bLmT2keQU7hDMdu1MFvIRo71VHGUW+C4IhQFoxlKjEe66ZV5J9W5pLRVxpEx8YLWXz9sIiUIp284nbIqqVs2PDLP6CQLmjeF2TpXp+QWLJwmbxvaQQqC1WpBkbBPfyZsjugp8cT0okWDTte3KIUKumIYMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2337.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 13:22:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:22:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 13:22:40 +0000
Message-Id: <DFP71473X1CF.30HRVWFYBRE13@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] rust: sync: atomic: Add AtomicFlag bool wrapper
 for easier use
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
 <20260115021230.3297420-3-fujita.tomonori@gmail.com>
In-Reply-To: <20260115021230.3297420-3-fujita.tomonori@gmail.com>
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2337:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed8c453-7bc3-44a4-ee5e-08de54392912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alVKY0ZvdnhxRXkyNmQ5empucU5tWXZPSktTN2l3TWxUQnA4Wlo3Zm5TRFdM?=
 =?utf-8?B?RVZYZzFLR2RRWE5oVkNVZmlENi90TGRBZjhLSmRNRVNDSVgvOGhhOVppR2t1?=
 =?utf-8?B?MXU3TkVaajNEQXlXNEtJSzhhUEswWmZuZUdYT2cxWTdWbDlrM1ZCUVZUNXJ6?=
 =?utf-8?B?MGZFWHFyc3FTWEVPU21CWFVMenhuUU5nMFFpbVN3YUtFSHZnRFNkSzcxM1Bv?=
 =?utf-8?B?M0JySWlWRVhRMUthN3FHWlgzcUZVTlZwVDZVM3A5YmJHZjNlZWhLbGpWbi9x?=
 =?utf-8?B?MVlFMFJ0RTlzbngwSjNzUlBaQldHb3hkcTROanVyVzBzM3VWNys0a1JvT3cx?=
 =?utf-8?B?SGJQZ1RaT0VrRnUzMEd2ZmhGWjM5OGRsWCtIdXBFb0IvaTJSbDhjaWIyYXJW?=
 =?utf-8?B?MDJvckNid0lUSFU0MG1tdlR2c3kyNnI5UGR0MkdLUkNIWWZ6Yy8vUEhLMlEz?=
 =?utf-8?B?eGZzTDZSZjVuOVdvb3I5YVZlYjRXMWxuSXJpK2gyUHJ0WE4rQWExa3Ewem5X?=
 =?utf-8?B?ZDVsSjNFSHE2ZEJzaXZQdXc2ZWx5L2ZwLzNuK2ZDbnJEdVRlakxMbXZjbDJs?=
 =?utf-8?B?MzlwSXRVaVZMRHRjcU5VbWNjMVU3dDBFNlJJMi91elQ3amVwQXJTSkNZU2E4?=
 =?utf-8?B?SklGWTRIR1hreGU3UTZlYTNWVzJ4Wk1qWktjOXRodURseS9Ma3dKS0FsY0wz?=
 =?utf-8?B?Q1FkMjNSQkJIdlBqOXdYekIwV1pjNHlWdkRsNmRaQ05uaWVZUU5pMDNMcTlN?=
 =?utf-8?B?enBMYUhzdEFXbHVsR0tBTVRHWURqTEwzbnFqVWJXN0RoemhENFhUTFc1ZVYr?=
 =?utf-8?B?T2R6TUhkMDlxZ0FXbDhkbTAvKzJSUHlZc0lxTUZVaEFSL1IzVTZHWGlmQVhV?=
 =?utf-8?B?MGptU3dXc0JKaVNyYXBhS0FTc24xR1pKVmNPdGNxcFE2TnkzMTUwVTNRWTFJ?=
 =?utf-8?B?UVlxUDJYRTBwSG1UUmFoTjAxSGdTQ01Ya3c5Z2trZFBRbDlsWUxEUGxxcW9G?=
 =?utf-8?B?emNzcXJnaDdKcWcyME5nalBDY3NvL1c4RFJnbDI0NUl4VnQyOThHQ3JmSUsv?=
 =?utf-8?B?ZkVvWU1sc3JqL004WCttV2FFaHRNUHZ4U2lJUjZqNW1MN1JHOGZXWC9pQzd0?=
 =?utf-8?B?NjR4ZFJqNC9mc0dJRWJrOVdOOHpLWUhiaDZ0RVQxcWNkR3JFbE5XU3BXT1Jj?=
 =?utf-8?B?WS9MUVdEZDRXYzdENzBxRDFVVjFlcjU3ZE1sUHZZTEZmYm9ZL01jV1pJaVFE?=
 =?utf-8?B?aDd3Y1lLMVBhSmFhOWhrS2cwOTZHK0ZKSFNhZ1E5eEczc056VzVVT1VLTmZH?=
 =?utf-8?B?TGk5ckNkK3prWCtBb01oR0twWFpPU2pMbHZUZ25WZk5neG1DbFpqRnFpSXZE?=
 =?utf-8?B?dFVUdmZVRm9oZ3J1V3VUekhpelZKVGV3QWQvSDlIK0ZYT0c2cXRxMGc1bmxJ?=
 =?utf-8?B?Zk1nZ2h2WFhBUjAxSXJHRUNSM3lEM254dDA4SG14YkVNRFpacFprUEM1SE1m?=
 =?utf-8?B?bnBjanI3UHNtY0Fidk9lUGMxTkxTRVYyNVJsUHVOUE1XVFB0UElJcEpKdk1r?=
 =?utf-8?B?NmNudzRGblBLekYwZVN0M1lkRW55bE9sUENNeFBJSTBUZW1Ya2ZwMUFYSVhk?=
 =?utf-8?B?UXhGdXlqcFVhalQ1VW5vbHFwN2FVdzRBZjZmV1RTSktVeDAydlNuZmthb1c3?=
 =?utf-8?B?VGowZEdGOEFvR1M1TU14cmVQZVNhRjZrdzlDRzV6WVp5VjAxVXBQa01aYk5B?=
 =?utf-8?B?b0ZhZG51OGtCaEczbXVsYjR0TW9mMkUxVk5vU1RLSkU2WEF4M2lvcEZJU0JI?=
 =?utf-8?B?TkEvL2pSTlpxYUZyOFZwUVRmZUJxQ1ZvdWttdmtmQ09GR0dtWVlQaFpKajRo?=
 =?utf-8?B?dmw3Myt0dWg5WU1UdHM5SVlzdkpra3hIbUJhbDR0TzZoS0NFeVdlWWJITjRl?=
 =?utf-8?B?alo1MVJOZ2dsWFl5dEgramhqK2xkRW4xUmNyb3ZsQ3d6YTJjQ29mTHdqdC9t?=
 =?utf-8?B?MzZRZXRIUFF5MHM2L1ZDaldmSVEvdVIrVE0xL1RwRlIrNk56WUROUVVzMHlr?=
 =?utf-8?B?Qk1ud0NRTjJWU3dVOEJ3Wm1XY01neFRwNXZvbXFiSTZsN2NYYzVSaEpwaWJh?=
 =?utf-8?Q?1NAo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJSbVBXWTgwVG1kVS9DSk9JMHQyYTlIR1dTUkdveTNoYitCUW5RM0N2Qzll?=
 =?utf-8?B?ditHb25vVWdBN0FTVyt4VW5EWjhMVFlpcEV6RGVsMGtZOHpvU1didEtEUUFt?=
 =?utf-8?B?TU0vN0kxeEZ2U1gvaEw5NnR6MzRJSSs5NFVkaXYvaWc1a1lWR3NqNHQrOUtx?=
 =?utf-8?B?UlN0RU9rOHFNMXNBUG9Cb1gwcHJMSTJLL2V5VHBZS0I0K2NvN3U2a1ZZbUdv?=
 =?utf-8?B?Um5JbGcwR1UwQzhzTmJSWmxyWnpHbE9VL0NxRjNVRFU0TjM4SytkQWI3bGtv?=
 =?utf-8?B?MUo0a1ovTUJLLzJVZUpqQVYwYlE4anU2NGU3MEJGWW9RWStUL2RYc1F5Wm1s?=
 =?utf-8?B?Wkp0RjBBeGVYcFNING5qVE9WRlVlT3UyVCtmUGtCaUxxdHd1blRVWTU1TTcr?=
 =?utf-8?B?Ui9BdzllMFNLeDdGTVVZTjVGYXF1NmN3ZWhGT0ZKSWJuLzRVTzRlR0c5MmVO?=
 =?utf-8?B?MkMzRElKREJpUGF0WkFycVgvbExrdVBqOFlqMTVSRWcwZm5oNDB0SHFZbGUz?=
 =?utf-8?B?c2tseEpmdER1ZW9yK3ZlT0RrRmV2RWNXcHBxWTFtSzRwRVBHb2VuQ1hUOXht?=
 =?utf-8?B?Y0hzNW1pT0hINEx6SVlyM1VoNXNJU3d4N1RvemJqbk9hc2FNYU1ieU1sZmkx?=
 =?utf-8?B?dHMzZkxOY2JxcUYybDAvSWJXU01QcU1nelUvR05Kc1Q4Y2NUTTkyL0t1U1Nk?=
 =?utf-8?B?WFp0azlTNitGZ0Zkb0NRQkZDV2c5bU5POGhyTGNTQjdvMStrdHVWT01mdlpy?=
 =?utf-8?B?VzRCNERaUTVpejA5WWJhZ3JvTWNYZ1JnZU5NRVdhUXpraTlNaytubzBKZmtj?=
 =?utf-8?B?K3dURjJrK1EySHBnV24wYTZaUVdSN3VJbGJLeEY1aUd0MzhZcFhDRDkrUUNV?=
 =?utf-8?B?dWU5d0pKanhHU3B5dmZKcmJxYVY5UG55R1czZlA3Vm96M2YzVDRtUk12M09Z?=
 =?utf-8?B?VmFWcWt6eXdNbmpBdGZ0dVQyQm0yUXMxMFUrdWJUVW5RV1l0eWZaelZ3QXV1?=
 =?utf-8?B?eFgzODB1OCtId1FiNkZQYmtidkpwaW1DaU1vYVBCUHIwOUxhc3orRTJNZ1ZV?=
 =?utf-8?B?TEVXa1U0bVRTVmFyaVRJaXdxaTdwelhhd3RGY0tCU0tTL2l0eXd1KzI5cDFC?=
 =?utf-8?B?UmYzTXBrRk01ZFp2cXl4OG9ETGcyMnlmZWV3R01tSUtyQklQOWlYa09wcU96?=
 =?utf-8?B?bzV1K1JaM05QdCtMbDgvUkFic2Y5VnJBOWJnZllFYXd6U2wzTGJUSEFhNU1z?=
 =?utf-8?B?Zi9rL3laUFB1aUl5MDdvK3ZFRnZLWDhYNDUzOUhaWWZ5TjFSM0hPM0FFYlQ0?=
 =?utf-8?B?aGhNd2RLNGJxZ2RGV21aRmhFOWhIMmtGSXdCb3pydTFSWk9oYjJETzhGZkc2?=
 =?utf-8?B?ZW1GUVBEM3VvTEFxMkVlV0tpL2I3dG10SVVndDFNdXNzQ3RjYUJzSk5ZWnFP?=
 =?utf-8?B?K214QmplbmdFanpTeVp1OWE3bEMwWXZ5UlFuWkc4VUo0RmxaWFVXcHpzdUFk?=
 =?utf-8?B?aGdldEs0STlIdVNwYTRDbWx5NlVLRmozTk1lQm1UVHNURkU5S25mYlZLYjBy?=
 =?utf-8?B?TlZPc0hLNzNKaGpXOVZPVnNINnlwVDFINm5scDdIQkI5M1Byb2NsbTZqMEZm?=
 =?utf-8?B?cUc2WXBPaFVCVWxNUWhJUUFaN2lia2UwUTNaMkJtb205K0lIZncxSGllb2lI?=
 =?utf-8?B?VnJUdVppYVZvOFBoVWwzNm8xZFJJbU5DM0xKU2t0Y2p1WWFsYklRYkZodVZn?=
 =?utf-8?B?UGZzUklLaG1IZVpseGduWVJhK2hna2RMNzRxVURuajZsMGNrL0NJVzBjR3Bw?=
 =?utf-8?B?OU1sa0V2OUpRSmQ0ejBIK3RUU0JWdHVyeDN4Y1J6QU1adk1PZVl5WFdSZFpy?=
 =?utf-8?B?UFF2VXM2aVowVTVwYURPSFRZellmL1NUSG1UWW9lcHhjeWhsZnMwUVlWaUph?=
 =?utf-8?B?Z0pNTk5YajdVWnNxVk9IUnF4UnBTOGVJUEFvdkNRMFdRaEVQZ01sMHd4RTEx?=
 =?utf-8?B?aVVPbTFuWUlxdEZqU1F4WERxdUJXNUFBUDV4Rkd1QmxmT0UrMnZZR3RHNlFk?=
 =?utf-8?B?M3EydUIwOFdhbThSOG5PcUFkSk1tRzNuY2RlVDhPUGpaTC9WZHlKUXNKYWFP?=
 =?utf-8?B?bkx4ZVRINzdmOFB5L0VjZlV0QXBEb2Rtb01vY3gvN1F3dENVVDdES3h5Tjg5?=
 =?utf-8?B?UXRnUEh4c2g1cElJWXpxWkYzV2lyaGNMSTZZY3kwTVhwakp4aDl3d3VFaVNy?=
 =?utf-8?B?L3AxcHRHNnhBKzZrSjV3V3RMNXlyR2lYa1NHQ1ZKWVd6eEVRZVFhbWJGdmJR?=
 =?utf-8?B?UHRRT3RnUnlteFpYQUJPTE1YNWg1UkdBQ0Z1K09FdURubWk0OEpPUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed8c453-7bc3-44a4-ee5e-08de54392912
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:22:41.2859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdcD58DutNOtQhnmDCLJOHKd+nWCgdwk1fy4ANPv4HGMNGQGzSEVQcqytN1t63RYgQ1Uw+pXIJ/OgpVgp+nOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2337

On Thu Jan 15, 2026 at 2:12 AM GMT, FUJITA Tomonori wrote:
> Provide AtomicFlag as a thin wrapper around Atomic<Flag> so users can
> work with a simple bool API for load/store/xchg while keeping ordering
> controls.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/atomic.rs | 43 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

