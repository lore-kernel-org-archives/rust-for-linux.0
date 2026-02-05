Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE682FF677;
	Thu,  5 Feb 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333578; cv=fail; b=JW7MN97EvMQf3PmwGKD9mLTmKK285b9ad07fpAJLGdo4DdyiozMTEZGRNAoa9kM59bpQb42uK4dDb3d3j7yVhQ8XQTVvzico4E0eB2CqJGYiIv1DGI4Ipbee02KKrzAJRgJnRS6ghY64DSEhOzNI3qfJD+U636PVqUQj7I0xqe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333578; c=relaxed/simple;
	bh=4eQ2JVHNJlabT0C3qdLw/RfXuLrHpS9BoDKmyhZqD54=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bSa514MQ0itXqqhqhqA5YDHTEVdb+dQ65ZOw01G4ZEDIc67NsDRqxF6/Ct4RBg3F7E+l/p6/MmpTdn1Icdt87VQB1yYwc8QnkVeqlkDdUpguWTFom7Qllir4+a2T5xYqoKVqcpP01mXhcQvlz45zrWs0iAFr7vdGWzdbjxmoKgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ABV8ixA2; arc=fail smtp.client-ip=52.101.95.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ABV8ixA2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY3NcILBwVeYjNM4Ub0J9L4n3e8IY3bpIfgHgxRqWAIeu4YGgJEOk+d8ljG96VV+d11psNDkvp7KbRzMv/aaVRqL9r59osdnTNMse1GCTTXnRk4ac55/dW24uycK1UEEM9DI16U+gjez+3SOrFJQpv6nxmwA+Cf7JbIP/2NSnXqEFK80GPLGY3DpMC1pg+ZYQMaumRtDK0pfVXPX340EdnW7Cy2+9cKhmYjmGpv4O+sbjg8biqgkGBX6eA7kkqyFAjhiqOuIleHPYBAgd/5TQt6fDCSn1v596J26Yw0q4HwNo9FEQDpww6sFc8MoHuJKu6VwhUubiVyoqjU/6c8Q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx8MkAn6Q5exAveAph2Ny4RgpzdUnv9WU4+UIJvEXX8=;
 b=a4FzUuu0SdoF/2lEntFPfslrWpg+DKULlXzsWaJ4prYVGNmUZLbWbZktniAzKya/T/g4uM4MFqMOoaSOek5qInbyBKKNcQ66Lic+KH2NL8aD52+SmOxTOxLroaj8JOtGaMeaR9jkjdjFkjDVhRsSzwL+Je4m+LJmzneMTAq1LoE79vQy9M5StqMUdhYbR/0afa9x28V3/zTqZ6HA4+YF012e7fBOWtQwCVagV24I4snBaJ56voRtWfQt746r3jpkq6cIca50fo8Z9lsF4F1+m85VITY5auxFJTJ56DY3Y9oPuuGvw5YTIwF5XMP+d98tb0Z/b3jAMLZ9FCx6D9Upag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx8MkAn6Q5exAveAph2Ny4RgpzdUnv9WU4+UIJvEXX8=;
 b=ABV8ixA2lQbZxqCT1mKBJZoZimmf8m0rlzlJuASGh09Oes21Oa3ddRbPENS7+HdaU2YspMKotvbl7Dn2uJb2piEEVcqg1LY5/SdlTWaJ1PkBY+3kJ7jUN33WbQzOtOWGuk5eRPze+dr4EElL3oFmsiCNF+CtQdOnRHcmHyj6pG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1926.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 23:19:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 23:19:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:19:33 +0000
Message-Id: <DG7EVKBS76KU.1XRUJ92G16BIH@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v18 4/5] rust: sync: Add SpinLockIrq
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260205204709.528234-1-lyude@redhat.com>
 <20260205204709.528234-5-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-5-lyude@redhat.com>
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1926:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b1b45c-1458-4bad-47bf-08de650d05ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RURkR3VpZjJucm9oWkN5cVFOdm13Zkl0OUgwY0UvQ3ZCZG1qQ21kT3JkZW1Q?=
 =?utf-8?B?VnJ3UnI3cmV5VkYrMTN3K3g4QVFUT0pHTFRLNUk2TU9rMGNhdUI0KzZHdmpw?=
 =?utf-8?B?RUZINGxGbGcvWERtZXI0TFR5eXk2cW9oV2JjTHlYN2wvTXl3NmF0dDRlbFAz?=
 =?utf-8?B?NjV2MXRYUUxLVzBkYkVpTlN6N0kvK0g2WXY0RE1WK0JRR1FKaWJIZGRDK0JM?=
 =?utf-8?B?dUgyZkJ4K3lnVjBPaXBKNXJaYkxVK1pzNm9qb1dud0VJMFFuMmlnMkV0cTM2?=
 =?utf-8?B?bzJ4emJFQ2xhSVhxMGhxOUpNMkwxQzVOM1c5czR1M3d1VHhFVTFzYm44MVkz?=
 =?utf-8?B?Y3FvcWNYU09oN1ZIb1crUmFNL1cwc1h1ZHFWZlMyVlhuNGdTaS84OUdxNXlU?=
 =?utf-8?B?MFhpSU9RSFZaM0VnYllBSWdTTDY0UzBuaVlyd2FERm1uZngrbzB2N0loeE5r?=
 =?utf-8?B?ei84ZjFWNkd3S3hhOS9YM2QvYXllc3BGcVBBaHRRUndLa291WkNBMENkS2N6?=
 =?utf-8?B?K1FCSnk5enFDNGFMbjBhY0dXdCtMa3BDditVdXRaeUxRd3ZUeGNrNUZDcnQ3?=
 =?utf-8?B?eEJtZ25KKytDaWdocXhscXZTVUY0TmdyeGxacVlLUEJzMlpuZUxaa1lZMW9O?=
 =?utf-8?B?YTRZQklqRW5HZ0tBYTJmYWtERVZxSmEydGJXeEJuL014ZGlTR2FkSllIQmhW?=
 =?utf-8?B?cWpOZ2FBTEZoUXp6OHNFUUgyR08vSjJkcUQ4Y2FscmNNdldwcUt1RzdNSFBm?=
 =?utf-8?B?K2FVeENiaUE3VTFTNGprMlVRRndxeWVoZXhCN3BwUHBMVnpodk12LzVOMm0r?=
 =?utf-8?B?MWVnaXdTUDlyL3Voc0xuK1Q4RVE5TjBDakxLbHZOU1BhWDFZWEwzNHZUNnY0?=
 =?utf-8?B?d2JueVJXMXQzYWNtMEVJZWd2NmNPVHBwNmIvYnpBMnkxVWUwV21QN0MxbHZ1?=
 =?utf-8?B?eHk3NnBQKzVySkU1UnRIaXozVE1lQTl5Mm1tMXVibktuNTIyVGM1eEtjZnV6?=
 =?utf-8?B?bFAzMlNHQm5yb0grMVhKOHdDSzlFTFRHdk5KZldPN1YxNjlPUW1mckRYeXps?=
 =?utf-8?B?dDdGaW5YTHBUR0NWdmZtWWxkUHFzUVFSalpHS2kxaHNvRlQzeUdPSVlUTlU0?=
 =?utf-8?B?dDNBWUR3UUd3QnRQcjJzeHJtYVFVaHhpblpCWGxRSFJSUngrWkxETElmVzF0?=
 =?utf-8?B?VlhqM2ZubXFkYS9ncnYrTjdWQ2tnaEJIZUdlWE9qdzFOQ1FmY3hDVFkwRm0y?=
 =?utf-8?B?VFRnY0Y2STg5VC9BVzYyOUVZRHR4Tm5ZTXpLeHJXc0p3RGZKbzRuNVY0MGVY?=
 =?utf-8?B?bzRiMjhpU2k1MVllSkNxYjBBYXpMYUhVdDRvZTBHTEVkdXZPbjBGUVBiSmFv?=
 =?utf-8?B?L1ArclZBcGNHenYyZVJ1TkNKTXNLaGMwOVBqQ082ZG00SUJ3aWM4UEFDMUxw?=
 =?utf-8?B?R2dsQXNpamw4aDN1ZFlYbkhHekt6K3o3UDBMSklQYmdqWS9Gd1hYKzN5MGpC?=
 =?utf-8?B?WDNiWk0rVm40MmxNNHYxV2RnNGZFMnM4ZTJ1T2lnTEprWGd0OExSanhoZWRE?=
 =?utf-8?B?OUJ5RjBGZ2lJR3ZXLzlEU3d1ZkRUUFRhc2lodjdOUUgxZUR4TjFIMjIvRDV4?=
 =?utf-8?B?SmVNalV5WEpxajFZbU8reEx4Qkk0bDJhUnBRdXNkSlpPUVZwUG90dW0rT05G?=
 =?utf-8?B?OXdKTkpUVVBrMzJmakY3ZWhTaFNKcWJpaFczUXZyMTQ3RjNTNlBWQmtFdC9P?=
 =?utf-8?B?OEZVc3JneUdscDNFSXdqSjNWUmdrbjJxKzVWRjN0ODNKaVF1V0JoeUQrci9w?=
 =?utf-8?B?Y2xQdGVGajFvajBQWWNLRHdnMFE4WWl6a25qcXFsakxhdnZsYTNRbFgzcW5Y?=
 =?utf-8?B?MHdGd0QrUXBLRzBuQmMxUytlWWU3Qk9GdFBiWlNwSHdaSHk4MmtXWDZtNzNv?=
 =?utf-8?B?bGFZQThFb0FqUXhlTHBDZm03OVU0MHBMSzBvU2dZakkrajJUVmhZQUtPQmZ0?=
 =?utf-8?B?M2w2cCtOTTgxVWIwUTVqNDFVL1NkQ2p2aGovWDNjS1hEOTFIZEJzYVN2d2tl?=
 =?utf-8?B?WTlTUFdFdmhCcGNFbUo2TE04WXhDMFlaLzFHWFoyUGllRkRyVzFOdDRJUW43?=
 =?utf-8?Q?O4l8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFhzeVp0aWJJS2lOR1UzRHhzZG40ZG91THQ0YnduTlNaT1V2d2E2bUIvOStj?=
 =?utf-8?B?SFJobmYxam5WQzRaalRLOEJZZTBUNUtnSUVtVE4yRVFqKzdOZDMvSEpYaUJU?=
 =?utf-8?B?WFZ1NjduWjdhZU1WS1hlVDRHWGhFQmhKQ2JSemtxc2pVN3VZRURiUFJlZk5K?=
 =?utf-8?B?b0hFb1dwa2JFTkZ6Uk1weG9sRGJ2MDlXME8zTm9rOEIrK2J6aFFFM012MVBh?=
 =?utf-8?B?TWw4TzZGSWVrRXB4UlpYUzdRVElzbmdhZTFRVzdGOEF0WEVFN2hYeFFaeSt2?=
 =?utf-8?B?WFJBTG5LVFFmUmJjaXpWeWJ2czI1NENhT2h5OWNZWDE1TjZ0ZENJUngvWjJI?=
 =?utf-8?B?TGZGRWRSTnJIUURXSU1ZWEw1Qm56bUVxazUwc2M3ckxtUlJIQ1lURTlrc0g2?=
 =?utf-8?B?bk1lNUF5MTBDZE80cU1qaE9TVGZlZTlzUFFPbXZOUUc4MGJoWmJaNFpuSzkr?=
 =?utf-8?B?azIwQzh2OEpFRnpPbWorcnZ6OHZnR0VmSllQdDBMaklKTm0rQXNseGZIcE5y?=
 =?utf-8?B?Vjh5OW4ra05salhqeUZicWJRVzQ1aEtNbDgrTWJ3M0pLVUlWVWo0UEZyWVQw?=
 =?utf-8?B?UUVuN0k2VGFvbjVtSC90ekZNV0dHN1FlYlVJMGd5QUJpYnhhSzRoT2w1L0Jq?=
 =?utf-8?B?aEFVWjNTKys1c1dDcUhWY2xET0JLMzg5Zjc4WmdJOVRPMnlpWmQrTmVuVFI5?=
 =?utf-8?B?Y25yczR1WUczT1plTWlndWJ6TU9xWm42dFlGZDhkY1VnK053cTM2Nk00M2ov?=
 =?utf-8?B?Qzhmd1NVc1BFQWlya1BYU1BKajU5SzlBNng3azBDMkhuREJ3WjlPejJ4YXA2?=
 =?utf-8?B?S21xYmpscVQ5Uk1PWGJGTnZreFhGczF0a0JJT2hrOVdWYkpnREl0K251d2kz?=
 =?utf-8?B?eXFxUXpzNkg1b1p4dzZJWjZob2NHcXY4WkE3Qm93b09OVEY2ZXB1NVNZbXM5?=
 =?utf-8?B?NDNlOTl4UFRkS1JDcUR5UHBnR2JUbVY4cTZPMG4vdFB6dUVJNkFxU3hDcncy?=
 =?utf-8?B?Q3BpNndreDFnam4zRksvV01YdGpZV1BDWGthZDM1bTJqeWJKNitJR1FFTWxG?=
 =?utf-8?B?TkRhODBEWS82QkpZUnBLMFhqdnNqWStzQ0s0T0h2VE1rb0U0RFozQ2o4dG8y?=
 =?utf-8?B?M0dXS3IrRk4wU1QwL2ZyMVJraHNqVEZ3S0JxQW94MWxSTUZ4eXczai85dVpS?=
 =?utf-8?B?VHNwUWx2UnJYUHU1UDhLQStBUkdhdTlVV21UY1p1Z2ZkeC8raHRGTys2UlNx?=
 =?utf-8?B?NGdhYWN5dkFRYUpMWFAxTlh4aldkM1BMNFV3aXVCQ3c0dytLSHl3emp6UlJ2?=
 =?utf-8?B?UC8xMUQ1Z3BoejJYUm4rSHpNcVMxYXVNUVlsR1JFTHkzS1UwZUxaMzcyU292?=
 =?utf-8?B?T05pekd6WXpYdG1Ga1Q5TVh2c2t2VE5wMVd0ZmhmWnNiYzBpTEY1Yk0vaG11?=
 =?utf-8?B?WDNKeVpoZlIrQ0hzd0VQTlhhVkMyTTJPa2dtZ0NhdHdtZzJnSTl1cGh2SEFl?=
 =?utf-8?B?ZlZ0d3lJVnJHOEh5N2s3QXZpeXZVMTlZbjZWalVkQWk3RklaSDQ5ZSs2MkdV?=
 =?utf-8?B?empSeGQybEttc0dvRDdvaUtQdCtPRjlFaTN0eXBpTmFoNmJ2WndNUjJJK3Rp?=
 =?utf-8?B?eTlBb1VHbzNwZk44TTlmbllHSkJYYmowMVNGa3FLRStVYkhiUW15alYrRmhR?=
 =?utf-8?B?d1hHS0dRTmNPRHJlRzRsQ1lBVHhkbnBkV0FQZHlrelR3V1RocURrY1llRlZo?=
 =?utf-8?B?RzJmc3lIdS9tRlJSenZsRTI3SllDRm8rbFhYeW9HUHhVcXdRUm8ybVB3Vzli?=
 =?utf-8?B?UFlscTBtZnRuZ0E5cVAxa0c5eDdjRW82eWZXcDJjb3NPWEJHblVVbG5JcUZT?=
 =?utf-8?B?andZYVE1K0RZSmdZWXFQSFFjVmFwRndLOGZsQXRYUkxVeWFFY0FFQUNBSXI2?=
 =?utf-8?B?Tmt2TG1FTERUQldWTmVZVWR6bzB4MUQweW1SS3dtN05DRU9YbVE0ZHpBdE9w?=
 =?utf-8?B?eGNXUi9VakJyMjF4cGpSRDZkSTJJN2RySG5RTG5vYXhKV0krcEdndlBaRUdw?=
 =?utf-8?B?REp5b08yNHZsUkJxckcydWg1S2F3aFRQUTJWaFpVdGJnY202MlRqaUsrZm10?=
 =?utf-8?B?eVphcHpnaG5QMTlIbjV6THFhQ04zS2ZBKy96VGVOUlhvbWNTMUxnQzB2N3lw?=
 =?utf-8?B?Z2FuRUxKQ3ZWKzRGay9FM3hFU0VDWHRHRE05dVg2YVZveVJINHhaZkk5MURJ?=
 =?utf-8?B?ZWNKWUtpMGVuWTRqTmtueU42dnMrajNkWjRmZ2NrT3p3M1VnSWZUOVh1anNK?=
 =?utf-8?B?WksyWmg2OXZ3NUtzYUVOQ2h0cEFpUTZGU01yOWd4SEJ2TXJrWkhNdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b1b45c-1458-4bad-47bf-08de650d05ef
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:19:34.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnt8qjz6Zx3ptknelMyoqE8SfrqXWFsvO/1y9UVMfo9uIdo+DQDRtoYuQG+AZdZU4sXHKJWhkeKErgUgH8HJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1926

On Thu Feb 5, 2026 at 8:44 PM GMT, Lyude Paul wrote:
> A variant of `SpinLock` that ensures interrupts are disabled in the
> critical section. `lock()` will ensure that either interrupts are already
> disabled or disable them. `unlock()` will reverse the respective operatio=
n.
>
> [Boqun: Port to use spin_lock_irq_disable() and
> spin_unlock_irq_enable()]
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>
> ---
> V10:
> * Also add support to GlobalLock
> * Documentation fixes from Dirk
> V11:
> * Add unit test requested by Daniel Almeida
> V14:
> * Improve rustdoc for SpinLockIrqBackend
> V17:
> * Update Git summary according to Benno's review
> V18:
> * Add missing comment change requested by Benno in V16
>
>  rust/kernel/sync.rs               |   4 +-
>  rust/kernel/sync/lock/global.rs   |   3 +
>  rust/kernel/sync/lock/spinlock.rs | 228 ++++++++++++++++++++++++++++++
>  3 files changed, 234 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 993dbf2caa0e3..58af785d62b99 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -27,7 +27,9 @@
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
>  pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockB=
ackend, GlobalLockedBy};
>  pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
> -pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> +pub use lock::spinlock::{
> +    new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq=
, SpinLockIrqGuard,
> +};

Please convert to kernel import style

>  pub use locked_by::LockedBy;
>  pub use refcount::Refcount;
>  pub use set_once::SetOnce;
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/glob=
al.rs
> index aecbdc34738fb..32efcbc870500 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -304,4 +304,7 @@ macro_rules! global_lock_inner {
>      (backend SpinLock) =3D> {
>          $crate::sync::lock::spinlock::SpinLockBackend
>      };
> +    (backend SpinLockIrq) =3D> {
> +        $crate::sync::lock::spinlock::SpinLockIrqBackend
> +    };
>  }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index d75af32218bae..f11a84505ba0e 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -4,6 +4,7 @@
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
>  use super::*;
> +use crate::prelude::*;
> =20
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
> @@ -143,3 +144,230 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>          unsafe { bindings::spin_assert_is_held(ptr) }
>      }
>  }
> +
> +/// Creates a [`SpinLockIrq`] initialiser with the given name and a newl=
y-created lock class.
> +///
> +/// It uses the name if one is given, otherwise it generates one based o=
n the file name and line
> +/// number.
> +#[macro_export]
> +macro_rules! new_spinlock_irq {
> +    ($inner:expr $(, $name:literal)? $(,)?) =3D> {
> +        $crate::sync::SpinLockIrq::new(
> +            $inner, $crate::optional_name!($($name)?), $crate::static_lo=
ck_class!())
> +    };
> +}
> +pub use new_spinlock_irq;
> +
> +/// A variant of `SpinLock` that ensures interrupts are disabled in the =
critical section.
> +///
> +/// This is a version of [`SpinLock`] that can only be used in contexts =
where interrupts for the
> +/// local CPU are disabled. It can be acquired in two ways:
> +///
> +/// - Using [`lock()`] like any other type of lock, in which case the bi=
ndings will modify the
> +///   interrupt state to ensure that local processor interrupts remain d=
isabled for at least as long
> +///   as the [`SpinLockIrqGuard`] exists.
> +/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled=
`] token is present and
> +///   local processor interrupts are already known to be disabled, in wh=
ich case the local interrupt
> +///   state will not be touched. This method should be preferred if a [`=
LocalInterruptDisabled`]
> +///   token is present in the scope.
> +///
> +/// For more info on spinlocks, see [`SpinLock`]. For more information o=
n interrupts,
> +/// [see the interrupt module](kernel::interrupt).
> +///
> +/// # Examples
> +///
> +/// The following example shows how to declare, allocate initialise and =
access a struct (`Example`)
> +/// that contains an inner struct (`Inner`) that is protected by a spinl=
ock that requires local
> +/// processor interrupts to be disabled.
> +///
> +/// ```
> +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +///
> +/// struct Inner {
> +///     a: u32,
> +///     b: u32,
> +/// }
> +///
> +/// #[pin_data]
> +/// struct Example {
> +///     #[pin]
> +///     c: SpinLockIrq<Inner>,
> +///     #[pin]
> +///     d: SpinLockIrq<Inner>,
> +/// }
> +///
> +/// impl Example {
> +///     fn new() -> impl PinInit<Self> {
> +///         pin_init!(Self {
> +///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
> +///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
> +///         })
> +///     }
> +/// }
> +///
> +/// // Allocate a boxed `Example`
> +/// let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +///
> +/// // Accessing an `Example` from a context where interrupts may not be=
 disabled already.
> +/// let c_guard =3D e.c.lock(); // interrupts are disabled now, +1 inter=
rupt disable refcount
> +/// let d_guard =3D e.d.lock(); // no interrupt state change, +1 interru=
pt disable refcount
> +///
> +/// assert_eq!(c_guard.a, 0);
> +/// assert_eq!(c_guard.b, 10);
> +/// assert_eq!(d_guard.a, 20);
> +/// assert_eq!(d_guard.b, 30);
> +///
> +/// drop(c_guard); // Dropping c_guard will not re-enable interrupts jus=
t yet, since d_guard is
> +///                // still in scope.
> +/// drop(d_guard); // Last interrupt disable reference dropped here, so =
interrupts are re-enabled
> +///                // now
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with
> +pub type SpinLockIrq<T> =3D super::Lock<T, SpinLockIrqBackend>;
> +
> +/// A kernel `spinlock_t` lock backend that can only be acquired in inte=
rrupt disabled contexts.
> +pub struct SpinLockIrqBackend;
> +
> +/// A [`Guard`] acquired from locking a [`SpinLockIrq`] using [`lock()`]=
.
> +///
> +/// This is simply a type alias for a [`Guard`] returned from locking a =
[`SpinLockIrq`] using
> +/// [`lock_with()`]. It will unlock the [`SpinLockIrq`] and decrement th=
e local processor's
> +/// interrupt disablement refcount upon being dropped.
> +///
> +/// [`lock()`]: SpinLockIrq::lock
> +/// [`lock_with()`]: SpinLockIrq::lock_with
> +pub type SpinLockIrqGuard<'a, T> =3D Guard<'a, T, SpinLockIrqBackend>;
> +
> +// SAFETY: The underlying kernel `spinlock_t` object ensures mutual excl=
usion. `relock` uses the
> +// default implementation that always calls the same locking method.
> +unsafe impl Backend for SpinLockIrqBackend {
> +    type State =3D bindings::spinlock_t;
> +    type GuardState =3D ();
> +

#[inline] hints for all of these functions.

> +    unsafe fn init(
> +        ptr: *mut Self::State,
> +        name: *const crate::ffi::c_char,
> +        key: *mut bindings::lock_class_key,
> +    ) {
> +        // SAFETY: The safety requirements ensure that `ptr` is valid fo=
r writes, and `name` and
> +        // `key` are valid for read indefinitely.
> +        unsafe { bindings::__spin_lock_init(ptr, name, key) }
> +    }
> +
> +    unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
> +        // SAFETY: The safety requirements of this function ensure that =
`ptr` points to valid
> +        // memory, and that it has been initialised before.
> +        unsafe { bindings::spin_lock_irq_disable(ptr) }
> +    }
> +
> +    unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardSt=
ate) {
> +        // SAFETY: The safety requirements of this function ensure that =
`ptr` is valid and that the
> +        // caller is the owner of the spinlock.
> +        unsafe { bindings::spin_unlock_irq_enable(ptr) }
> +    }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState=
> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initi=
alized before use.
> +        let result =3D unsafe { bindings::spin_trylock_irq_disable(ptr) =
};
> +
> +        if result !=3D 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
> +
> +    unsafe fn assert_is_held(ptr: *mut Self::State) {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initi=
alized before use.
> +        unsafe { bindings::spin_assert_is_held(ptr) }
> +    }
> +}
> +
> +#[kunit_tests(rust_spinlock_irq_condvar)]
> +mod tests {
> +    use super::*;
> +    use crate::{
> +        sync::*,
> +        workqueue::{self, impl_has_work, new_work, Work, WorkItem},
> +    };
> +
> +    struct TestState {
> +        value: u32,
> +        waiter_ready: bool,
> +    }
> +
> +    #[pin_data]
> +    struct Test {
> +        #[pin]
> +        state: SpinLockIrq<TestState>,
> +
> +        #[pin]
> +        state_changed: CondVar,
> +
> +        #[pin]
> +        waiter_state_changed: CondVar,
> +
> +        #[pin]
> +        wait_work: Work<Self>,
> +    }
> +
> +    impl_has_work! {
> +        impl HasWork<Self> for Test { self.wait_work }
> +    }
> +
> +    impl Test {
> +        pub(crate) fn new() -> Result<Arc<Self>> {
> +            Arc::try_pin_init(
> +                try_pin_init!(
> +                    Self {
> +                        state <- new_spinlock_irq!(TestState {
> +                            value: 1,
> +                            waiter_ready: false
> +                        }),
> +                        state_changed <- new_condvar!(),
> +                        waiter_state_changed <- new_condvar!(),
> +                        wait_work <- new_work!("IrqCondvarTest::wait_wor=
k")
> +                    }
> +                ),
> +                GFP_KERNEL,
> +            )
> +        }
> +    }
> +
> +    impl WorkItem for Test {
> +        type Pointer =3D Arc<Self>;
> +
> +        fn run(this: Arc<Self>) {
> +            // Wait for the test to be ready to wait for us
> +            let mut state =3D this.state.lock();

Perhaps throw in an irq actually disabled assertion from the module in patc=
h 1
here?

With these fixed:

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> +
> +            while !state.waiter_ready {
> +                this.waiter_state_changed.wait(&mut state);
> +            }
> +
> +            // Deliver the exciting value update our test has been waiti=
ng for
> +            state.value +=3D 1;
> +            this.state_changed.notify_sync();
> +        }
> +    }
> +
> +    #[test]
> +    fn spinlock_irq_condvar() -> Result {
> +        let testdata =3D Test::new()?;
> +
> +        let _ =3D workqueue::system().enqueue(testdata.clone());
> +
> +        // Let the updater know when we're ready to wait
> +        let mut state =3D testdata.state.lock();
> +        state.waiter_ready =3D true;
> +        testdata.waiter_state_changed.notify_sync();
> +
> +        // Wait for the exciting value update
> +        testdata.state_changed.wait(&mut state);
> +        assert_eq!(state.value, 2);
> +        Ok(())
> +    }
> +}

