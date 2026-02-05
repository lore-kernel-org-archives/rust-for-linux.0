Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020104.outbound.protection.outlook.com [52.101.195.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CE336EE1;
	Thu,  5 Feb 2026 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333219; cv=fail; b=CNqhVaBYHPzT/+Q0cX/X/0PqU7E+2h8nsNyngBIhKJSImX1z24+IInhGFjo03UdemAoC4SLtg3l+GS90n5zyGFPxkFs49383IDtTLy5HQKL+7xwLzIHqtMGChKSylURrrqJUoMfsrMmzUCDPZ+uygtIKsNO9F2YIfDACCXgIzrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333219; c=relaxed/simple;
	bh=/rM8fDFaprjOiBW5YbURKhIFdSLwIBHG+qcoqkLzAJg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AqnLOg/Ewzro+uXBaBecOpqj/+ULqtrViqGxay8x6HgsNPBzfO/kB2eu6s3wrGPeie6k+bl2n6VQa/ZKt5ofrW2lBBxB/EpvEsQZXAvS6hvEolmHynMscNt8MiJdaShFHq85QodpR6/Mehvd42XJSDxTN65M2jOyHoNYKrW0ffc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QgdYv5Kf; arc=fail smtp.client-ip=52.101.195.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QgdYv5Kf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/F02zGpL7p4ganhU3iJ4vab3JxqpYPQ2C3b7CrMVESroIbIQMgjS/ygYP+1zSClyN6j9o7ViB0vG6PVdAu03tU0KvdjQxeBAELfPpLK7qo2nD9FnY1rughIyzEyE/VKAckySJzRsgaS3pgMvNPkAPXhN8RNAFyxgNNC8rf0b0gI5wSOGVaNLa9ydKM2xf7u7Gey8eQOjUrduPy2g3EVZam8b35gjWq/AutRjS1/3FxxnKNbT/gykzQpfCajaqzMSslSJ55lAliZ1LHvU7NsUugReGFWNU+h+XcIxosoUqzOKHJCbMJQZcnKzrHxHQxJqnKluyJcH4GXEEhryIVBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZfPGKTRulg7ShN9K087c+o3tEwrvp0g3+jB1DfikhA=;
 b=FI8bY4P3tv4KeuYGwG1nGu6Q99cmK4dNJnJujRxGL7a3AywPlkv1GvGQ/8s+vmPsdiRI3nYxjgyAHax58nEMSyZhvQhv2CqypWO2jwHhtYvObMULg6X1I/pvtJLzElnkBpzxwVf8oHjBs9XckvKXuPAcbJe3NoG3o+U+e5wmpq2lGSPylJSzToqVdHM+lB+cCgJmFhFLdcQoVWBYXZottcklAuucctrDYKk+hCzXn4KS8ViYvLqSGbEe7gR1nJydQFNGIz9RLk7yixU8d6blfpHHKMmpi4pKtaFvy97YV05nsEuZ/nPIzoW44cEnsjHRIrWdsynrswR6F+9O1ZN+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZfPGKTRulg7ShN9K087c+o3tEwrvp0g3+jB1DfikhA=;
 b=QgdYv5KfqEp+DqcaugA7INvu88q8M165mxQilFjiv40jQhUnNC4rUBohs16FbgjJtktnycQYOMnCRsuOfZeMdvtgrXZPlKyONLZJflDopr9+q5Gf/Al2LGkWO03ENukomjtW8KGS2LjVvbeOgALqN49TeOD5te5u+gA0Y6kqVJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3544.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 23:13:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 23:13:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:13:34 +0000
Message-Id: <DG7EQZ2NMKML.U8PMHCU81O59@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v18 1/5] rust: Introduce interrupt module
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260205204709.528234-1-lyude@redhat.com>
 <20260205204709.528234-2-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-2-lyude@redhat.com>
X-ClientProxiedBy: LO4P123CA0229.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3544:EE_
X-MS-Office365-Filtering-Correlation-Id: b73ecaf1-bc72-4bac-3ef8-08de650c2f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEUxcEN1L3ZPNVRKSk1MTDd1NGtDNlNEbDFFL1RvdDE0UVJSSmVBOUs1Vldv?=
 =?utf-8?B?blQ1WGswQkwwMHFpdW8zQlNydDkxMlRsaVdBNXRVNlp6NEpzbkozWnZvYlNy?=
 =?utf-8?B?dWlsUW9icXltVGFneEgvNlYybGt0T3NKanZ5VWFBWTRJUk5DcDhUd1hpcjdN?=
 =?utf-8?B?YUJaUmtKYkloZjRMNzVib3ArQTRFRldXRUVKRU1kUXhRZGw5YkdVcmU2N2JC?=
 =?utf-8?B?dVZ3RFlrNDZJYzFMRmkzZzdFWVUwUHgzalc4VWMxYlRCOWV3UFRwRUZNNGU5?=
 =?utf-8?B?bTBNNVhvTncrKzlkMHZQU3JEbWhWVzBhWGpuSzc4aG5qbUlUeGQ3L0tNaVJU?=
 =?utf-8?B?SDhiMm5YazBXSGo1NXFqTlJMQjNQWUE0aHVDLzJIMDM4SjJ1eEs4K2NnK0Y2?=
 =?utf-8?B?WEVhbHV1amxMY09QdDJqOHFtUUVudnk5RjFVWDJ4R3lZYlY2cHlVTVVlZDEr?=
 =?utf-8?B?b1AreFNvemRCbjV3SDBRaDVjUktBR0RXWndmSmt5bGtoSVdqRHQ1TGlQd3Bj?=
 =?utf-8?B?UDRBYXpQbW1OdEltTS9TcHY1OEdTNjFWN21VMytVckVHSWZLVzZmZDladlVW?=
 =?utf-8?B?SG0wVmFGTWdLNXI4K2h2MWJDSHNjYnlVT2VVQk53YzV6MHlOeWZRNkRCQzJ4?=
 =?utf-8?B?Vk8xNnJ6NEVSMkprN1d0cXBES1ZnN2xFcmJkOTVrRS9SRTcwb21FOVhxaWRS?=
 =?utf-8?B?VHhEZ1NBb1R2VFg2UUxJbkRCdkg0K1hvOGsxK244R2JlbjlCYmVQbHdFTyt4?=
 =?utf-8?B?S1FvTmJtR3FnbjBQVTVXbU9HdXlEL09XM0l3bGtCWm1lcWlhaWxXVXoxTDYv?=
 =?utf-8?B?TDZHQTgvSUNOUEJFMkk3c2ZXaDdsbDhCelY0QTlrcSt6M2o2OWx0d1RmMzY5?=
 =?utf-8?B?T0I5dzdLWVN2WHZxSHdQaDYrQWpMZFJkZ2s0ZkUxMW4zT2xObzg5S203NEtE?=
 =?utf-8?B?QkljQmVzOCsvMnZxclJCY0g5KzVIWWowWjBibWU3WUhjbU1yWURDSG9pMWk0?=
 =?utf-8?B?NjZzNXR5WHBadzF1RWdvNGFjVnlvck1jVURXcUthU0xmdjMxaDJpZFRrNmlQ?=
 =?utf-8?B?R1FlMktQWUVEOGRldEdiYUdJMUMzTHhUOWFtTUlWeFZRQ1RkdFZJd3ZLbjJM?=
 =?utf-8?B?MFpYbTNsMG9iOUllQ0xIdUlaZ2syTTV0dUcyeW14c2pjSlVLcVpwcGpMODQx?=
 =?utf-8?B?aDU5aFlDNkl1d2Z1N1RSRU9xNGRDVS9RMUtzWk9nTGUzZkt1OVJBZVp6ZXhC?=
 =?utf-8?B?TmlTOVF0eTlMUHBSK1E1ZklJWkhnN29jb3REc2d1SDAzNmJ4MHdwbGJLbjZl?=
 =?utf-8?B?RnNGZk1peEtuZXNYVHBkRXJOSXllajhkSGZuWEo3eElLWThKY0hDN2RBWTJQ?=
 =?utf-8?B?cHFLd2dOeGViQkRnNnNHaTZFWWdtbzhiVFEwZGJVVm1HUzE2d3FIdjhwOFgz?=
 =?utf-8?B?MmNsUmlvM2Jnc3pmdjI4NU9LT1VSTWNEK1MvaERzNW1ZZWxxajVhY2tNTUEx?=
 =?utf-8?B?WlVZZE9ob0tUZEUzQVRMYms5NDhoKzR4ZnRWUnJZd1M3NTY3S0NlRVBLTWRZ?=
 =?utf-8?B?YndQRncxVGw3M21VMXlBUVFId0ZhYU10THBydlJnbGRYYzRtSjRQVHhBcHFW?=
 =?utf-8?B?dHhyejZXbWcrQXJhcFg3dEdlcmpKUWljQkVOUVVVOVNGY3VtTUtXY1ZFSzBv?=
 =?utf-8?B?c2hsRmlZdmt4bHZtSkg2UkVyb1MzTEpQbm5tT1RZT1NyWDdFei9VRXVFVU5Q?=
 =?utf-8?B?LzRPWEt5ZUxUZCt1WTFId1dxKzRSVUlHVnY4Z0RhNlIra3FGODhWcG5nQUh0?=
 =?utf-8?B?Wmd6KzhSc1NQU2R5cE82MzJneStuWWI4WGVSNGlTbWpUTUVRSTVXd0ZSdU16?=
 =?utf-8?B?T3dPd1hOQWxzUDVFc1pYcHJDdWFVbndBdXRLMER4NjcyRXVCZ3NpdC9PSk5H?=
 =?utf-8?B?SFRaV3dUcG03dThGVHc0bW01OXRyc3pBMEw0bDNsL0ZWb3E1WktNNGdoWFlK?=
 =?utf-8?B?dU4xekFCZFNBdjRNSXBvemNXVG45WGwwU0FFWXNQa1JYZmlyV3ovS3Q0blJU?=
 =?utf-8?B?TU0zUERsMW5vTnUwZVFha2FycTUwRmRSS2lTKzVIM3ZhOEIrMXlDb2lXaDN3?=
 =?utf-8?Q?2+XI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0dXbUFkYi9MZ2lEN0xFUmtnNWdjSm4rTDZOM2ptKzhVZlJKRTYwTkdDRmZ1?=
 =?utf-8?B?QjB3ZkNXUzdyMmhjeVRFL1RBb1ZjLzNrQ3dtWlZUVzNYckNNaHJpdHR2UEc2?=
 =?utf-8?B?cnV1VVdnRUp5d0x4Zm5FU052YXpXazBlOWNrK3I0enNUdEtEV3htc2JCc3E5?=
 =?utf-8?B?dXI1RVFLZnk5V0lMTjR2anU1ZW92QzZiVEdQeXBBcFBXK1ZVTllsdDNkc0Ns?=
 =?utf-8?B?M2tYYjNHT1dJVUlXQlRXSURqVmdrNlZOYmdDbkY2VGliaTVRMEU1M0ZSUFl2?=
 =?utf-8?B?UnQxWHBQcUo5b0dTUGIzZG5XZXlibHBmNmlSOFVZVFk5YmJYK1B5YkNKY2gv?=
 =?utf-8?B?QWRTK1psdFlaNTNuUy9NRXZFSXJGZXZlemVteHRhZ2h4cEhTMjgzTW9CdXAy?=
 =?utf-8?B?cW45eEY2cXJHaktNTEJ0OU8wREhyaDNjbXpydFhDMUxKQVRXYjAybElNb0FK?=
 =?utf-8?B?bFhOdnJuU2xXU0VubkxvcTVXZG5GMzE2V2RuY2ZWVXliS3lGVEFkWUVQSTlC?=
 =?utf-8?B?SXVGaEJOaTR6TXRqNjlVTmtlWnBHN2RteDJWRHB4Y2xsZ0lob05ubGR5cFJX?=
 =?utf-8?B?OXV6UHRRNnZWY0ZuTkFBWUF6N2l1SFZHNG5venNSbFdxaHJMWmlkdVJFdGg4?=
 =?utf-8?B?d0czcWw2T2hKaHROTUhEajFQMkhLQW9tczZxR08raVcyZjd5OFhDQmVtZlpB?=
 =?utf-8?B?b0g5RG4wUVY2NG52TDNrYjBQMnYyUjIzUURzWlBPTVAzR3lDeHBJckVOQyti?=
 =?utf-8?B?eDA0emlLYm1vSkRHd0JrWWJmR3lZSmwvTGk0aEtQcktDcWtoMXE3Q2MzWGhn?=
 =?utf-8?B?OGkwRFUrYm1ua2FuZjBJcUVjVnk4NUwvbG5aK3RZQjRrSzN0ekpjdExhdktB?=
 =?utf-8?B?YytvMzZDcEIzd2hNVEo3dmQ4WDZ2VllUWGEwUjhyVFFCQTB2SEhZdUxuM3JT?=
 =?utf-8?B?S2dwcE03WUowdnJLb3I2eWlsNFFMSklTSUVZUUNQSHZjSCt2NWF4MWdxcVZM?=
 =?utf-8?B?ck5HZVk1bHpOa0VBWmZwa3ZkTTZpWFpMYVpYY0htUEhpdzRuL0E1aUFxYUxK?=
 =?utf-8?B?YnVxK2RRMk04WURkN2svTURZZW1Sa2d0a1FGLzh2bklGMmlhSmRpVjBJWHR6?=
 =?utf-8?B?Y0xOUHRZc0IwNytjRGFHcUlZb1huT3pPamV0eVhhY2FkUnhVM2JzZFI4STIz?=
 =?utf-8?B?MnpQNVlHbVhWM0gzZEVMdCtZVjVISzcvTUtaclB6QjM5OStkcXdVRVBFQ1FW?=
 =?utf-8?B?SmhZOHVyaGVSN3FWYnJiNkUyNHBTK0w0QXRrdFNDOHZMd294Qy9rdWRQMHYy?=
 =?utf-8?B?dmFjSmpZTTVYU0dQNERCMnlNazlVdGtqUW5NZjBFYStkV3VlelV0eHRIZU1N?=
 =?utf-8?B?ZG1rWTVCaXZjQm1HNnFWZ0h4Z1AxWndXMy9obVZWMk5CZXZIZ1FmRUJnY216?=
 =?utf-8?B?d0xnMkRJRmNoNVFWUGhIT0tvRzg4enRscWxjU0V3N1IrZ2M1b1BsWGd3UXJy?=
 =?utf-8?B?YUVKZ1NLRXJLdEZMaW5uNlI5NnRIaVgreGhSaG1kY0t0RnRlbW5ZU1lWSkpO?=
 =?utf-8?B?NVJMWEszNVdLdjhydjlXRzkrNXMxK0w3enRzMjBUYWVLYittL0RIc1ZUNnVh?=
 =?utf-8?B?b29RalFJZGw2YktJWlVtcThoTTRnbTYxT29POC8raFdPNW13eHFka2NUT0oz?=
 =?utf-8?B?elVRbkpSWHlpakpJTjk5WE90NUdmR1JySDRWMWRQTGRPaE9QYUwyeDJSOFdW?=
 =?utf-8?B?c0Z4WDV5Yll4SWJESmhZMnFaa2pSbzQ4ZFdiYjhOM0dpNFZEYXZKeUZ6dkFM?=
 =?utf-8?B?WmJNbGZqL0VDak93M0xGRnpMK3F3NW81bWw0RFpyQnFYRUhNZUpZT0NOUnZY?=
 =?utf-8?B?K1JjUGh1UHh5WVg2WWVibVVpZzRxZnVmT3QzNUJySlRyelQ5VW0xMUkyZ21l?=
 =?utf-8?B?WmZaQWtRdHFYakJZbC9XRE1uK2dEYTgraEhJL3lFRDN2eUdIaG14MHpUUEhp?=
 =?utf-8?B?aHNTZi9QeHdsQmVKRUZqVzV2aElQK1FLNWdkNVNVVzdMRWlNTXRoNDVHcjlN?=
 =?utf-8?B?cnVuMUwzbzRLT1JkSHp6RUNUbVZmaGtQN1hCaFNaWndaWUFQamtOUnU0d3hu?=
 =?utf-8?B?VkRFMUpmMnhwaVhrUk1ZajVOYWUyV21QekpYM0IrY1hHNjBTcHYvMnNQeEV4?=
 =?utf-8?B?b1duSFBCcU45b3hDZEhZWXA5bU40QU1rM3lSL0FIa3BTYkpidWJXWXQ3WjNJ?=
 =?utf-8?B?VW56VEZLZ2pOaWRkd1dWWXZXRFFXQ3I1Wmhnc2FwOVZyMlEyU002cDZhT2pY?=
 =?utf-8?Q?+moyfYgXPXpTSiL7gn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b73ecaf1-bc72-4bac-3ef8-08de650c2f88
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:13:34.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIL0996+7PJb4Q5hdWvjLZ6gxCoFZghpUriq78PYAnBeaRy0fQvg4qf2OEx/Vj7WhCIu5Z2UJIZxX9eDXhBW6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3544

On Thu Feb 5, 2026 at 8:44 PM GMT, Lyude Paul wrote:
> This introduces a module for dealing with interrupt-disabled contexts,
> including the ability to enable and disable interrupts along with the
> ability to annotate functions as expecting that IRQs are already
> disabled on the local CPU.
>
> [Boqun: This is based on Lyude's work on interrupt disable abstraction,
> I port to the new local_interrupt_disable() mechanism to make it work
> as a guard type. I cannot even take the credit of this design, since
> Lyude also brought up the same idea in zulip. Anyway, this is only for
> POC purpose, and of course all bugs are mine]
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> ---
>
> V10:
> * Fix documentation typos
> V11:
> * Get rid of unneeded `use bindings;`
> * Move ASSUME_DISABLED into assume_disabled()
> * Confirm using lockdep_assert_irqs_disabled() that local interrupts are =
in
>   fact disabled when LocalInterruptDisabled::assume_disabled() is called.
> V18:
> * Add missing __rust_helper annotations
>
>  rust/helpers/helpers.c   |  1 +
>  rust/helpers/interrupt.c | 18 +++++++++
>  rust/helpers/sync.c      |  5 +++
>  rust/kernel/interrupt.rs | 86 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs       |  1 +
>  5 files changed, 111 insertions(+)
>  create mode 100644 rust/helpers/interrupt.c
>  create mode 100644 rust/kernel/interrupt.rs
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a0..ff628e9c5ffdd 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -32,6 +32,7 @@
>  #include "err.c"
>  #include "irq.c"
>  #include "fs.c"
> +#include "interrupt.c"
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> diff --git a/rust/helpers/interrupt.c b/rust/helpers/interrupt.c
> new file mode 100644
> index 0000000000000..51b319bd4c006
> --- /dev/null
> +++ b/rust/helpers/interrupt.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/spinlock.h>
> +
> +__rust_helper void rust_helper_local_interrupt_disable(void)
> +{
> +	local_interrupt_disable();
> +}
> +
> +__rust_helper void rust_helper_local_interrupt_enable(void)
> +{
> +	local_interrupt_enable();
> +}
> +
> +__rust_helper bool rust_helper_irqs_disabled(void)
> +{
> +	return irqs_disabled();
> +}
> diff --git a/rust/helpers/sync.c b/rust/helpers/sync.c
> index 82d6aff73b04f..4f474fe847c41 100644
> --- a/rust/helpers/sync.c
> +++ b/rust/helpers/sync.c
> @@ -11,3 +11,8 @@ __rust_helper void rust_helper_lockdep_unregister_key(s=
truct lock_class_key *k)
>  {
>  	lockdep_unregister_key(k);
>  }
> +
> +__rust_helper void rust_helper_lockdep_assert_irqs_disabled(void)
> +{
> +	lockdep_assert_irqs_disabled();
> +}
> diff --git a/rust/kernel/interrupt.rs b/rust/kernel/interrupt.rs
> new file mode 100644
> index 0000000000000..6c8d2f58bca70
> --- /dev/null
> +++ b/rust/kernel/interrupt.rs
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Interrupt controls
> +//!
> +//! This module allows Rust code to annotate areas of code where local p=
rocessor interrupts should
> +//! be disabled, along with actually disabling local processor interrupt=
s.
> +//!
> +//! # =E2=9A=A0=EF=B8=8F Warning! =E2=9A=A0=EF=B8=8F
> +//!
> +//! The usage of this module can be more complicated than meets the eye,=
 especially surrounding
> +//! [preemptible kernels]. It's recommended to take care when using the =
functions and types defined
> +//! here and familiarize yourself with the various documentation we have=
 before using them, along
> +//! with the various documents we link to here.
> +//!
> +//! # Reading material
> +//!
> +//! - [Software interrupts and realtime (LWN)](https://lwn.net/Articles/=
520076)
> +//!
> +//! [preemptible kernels]: https://www.kernel.org/doc/html/latest/lockin=
g/preempt-locking.html
> +
> +use kernel::types::NotThreadSafe;

I think we currently more commonly use `crate::`, although I personally wou=
ldn't
mind to use `kernel::`.

> +
> +/// A guard that represents local processor interrupt disablement on pre=
emptible kernels.
> +///
> +/// [`LocalInterruptDisabled`] is a guard type that represents that loca=
l processor interrupts have
> +/// been disabled on a preemptible kernel.
> +///
> +/// Certain functions take an immutable reference of [`LocalInterruptDis=
abled`] in order to require
> +/// that they may only be run in local-interrupt-disabled contexts on pr=
eemptible kernels.
> +///
> +/// This is a marker type; it has no size, and is simply used as a compi=
le-time guarantee that local
> +/// processor interrupts are disabled on preemptible kernels. Note that =
no guarantees about the
> +/// state of interrupts are made by this type on non-preemptible kernels=
.
> +///
> +/// # Invariants
> +///
> +/// Local processor interrupts are disabled on preemptible kernels for a=
s long as an object of this
> +/// type exists.
> +pub struct LocalInterruptDisabled(NotThreadSafe);
> +
> +/// Disable local processor interrupts on a preemptible kernel.
> +///
> +/// This function disables local processor interrupts on a preemptible k=
ernel, and returns a
> +/// [`LocalInterruptDisabled`] token as proof of this. On non-preemptibl=
e kernels, this function is
> +/// a no-op.
> +///
> +/// **Usage of this function is discouraged** unless you are absolutely =
sure you know what you are
> +/// doing, as kernel interfaces for rust that deal with interrupt state =
will typically handle local
> +/// processor interrupt state management on their own and managing this =
by hand is quite error
> +/// prone.

#[inline] for this and other small wrapping functions.

This is a non-generic function. While newer version of Rust compiler starts=
 to
automatically mark things inline for small functions when it sees fit, we s=
hould
still ensure that trivial functions are annotated as such.

> +pub fn local_interrupt_disable() -> LocalInterruptDisabled {
> +    // SAFETY: It's always safe to call `local_interrupt_disable()`.
> +    unsafe { bindings::local_interrupt_disable() };
> +
> +    LocalInterruptDisabled(NotThreadSafe)
> +}
> +
> +impl Drop for LocalInterruptDisabled {
> +    fn drop(&mut self) {
> +        // SAFETY: Per type invariants, a `local_interrupt_disable()` mu=
st be called to create this
> +        // object, hence call the corresponding `local_interrupt_enable(=
)` is safe.
> +        unsafe { bindings::local_interrupt_enable() };
> +    }
> +}
> +
> +impl LocalInterruptDisabled {
> +    /// Assume that local processor interrupts are disabled on preemptib=
le kernels.
> +    ///
> +    /// This can be used for annotating code that is known to be run in =
contexts where local
> +    /// processor interrupts are disabled on preemptible kernels. It mak=
es no changes to the local
> +    /// interrupt state on its own.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the whole life `'a`, local interrupts must be disabled on pr=
eemptible kernels. This
> +    /// could be a context like for example, an interrupt handler.
> +    pub unsafe fn assume_disabled<'a>() -> &'a LocalInterruptDisabled {
> +        const ASSUME_DISABLED: &LocalInterruptDisabled =3D &LocalInterru=
ptDisabled(NotThreadSafe);
> +
> +        // Confirm they're actually disabled if lockdep is available
> +        // SAFETY: It's always safe to call `lockdep_assert_irqs_disable=
d()`
> +        unsafe { bindings::lockdep_assert_irqs_disabled() };
> +
> +        ASSUME_DISABLED
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf1200428..fbe830c4c54e4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -101,6 +101,7 @@
>  pub mod i2c;
>  pub mod id_pool;
>  pub mod init;
> +pub mod interrupt;
>  pub mod io;
>  pub mod ioctl;
>  pub mod iov;

