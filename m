Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020085.outbound.protection.outlook.com [52.101.196.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B128C2DD;
	Mon, 26 Jan 2026 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434266; cv=fail; b=fMJHCPyCqh3QwR+iCWsVSYQ5ooWcAdC+E/hEo8EN2+WPMK9+P3RGBP0Jz8FKpoTqFYuSOLxesTwfR1WJApaDW4JFCfiuQTS/vatGWh/3jg8ZGWWjOyIJ8LG7jzDn0ry9wOrHE1qDNfZ3DaaUhDLoLlTAsgMeXx5K8LoIQzUv4gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434266; c=relaxed/simple;
	bh=5A+VqCn8Hg2CPmoCecQUB3IlGFQ3IVKXc55yFCh/v7w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B9cyqPdspmjP9DgyUZYag9MILpWSBLHa67ZrjatwYkVAD5sjOnN7ITCFtCXdcN/fgp+JnBXpvJKNUxtyMcaRUD6aUaRD7Z9Lnz8thvxnaplWRIrwOzg/L4dAPW5r8MoDDiRfZtOR7p8VZ8xjJPsPvcP/47dmq0jyRKt+OPmLRjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DqA0Et4K; arc=fail smtp.client-ip=52.101.196.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DqA0Et4K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfM5XrFjtXlZlDhiBWMFxWZd9fYT2oOKiHkoa9e61S26lmxR6+kGDiVKaavPIn+oK9YcEvpz1zSewgp+1ppXea5HKIckNZTMqvdiO+hIHhmA4tkU23X8IPZUs2+sWQEP7kBHFLLxzi08vapRxY0Y6AqYc0IZ/D228RF68BbfzTCPpaFDJUSC0m1ULzf9Iz4vNDxOTY4APB9aSjT5vuV/rojU6v1VZ1045ZlX7ut5+acstM6Et5PUcADgg865pmaZGqlEo6UpVZpBdIxTep/LwN4yK4SmhSuYGloaE29c2LIvFOZCY42aSYnUCPvDpHFALvq9a6VdMIedA79v8kXPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQs+NywK9I2AwBcH3MlM8BKPW5Vzku6glFriloCVQ2E=;
 b=J1C2pRrL2SiwotQJTnGGVqHoXMQSD0rNeVr/K5bJ5aPSl9hi8wkGM4tFjQnsu6XtL0UacEdt7Ni68TnkMDEHHtGpbbYqNfUQ/8vxKiJuLJWaO293brum5jwgjf1PIbIqU3ZOBktVYvyKvTa1fEpXH/iEKQfRMeO0yXKpcXmQvswlZKRefSV+TFR8HPaqEFuD5u8iSEJrN60HHgo3PCVIZF4B6y/YKe/nNqGnO7A5WOs5/YhON5P1jaQb42YNS9W+zU6149JxsYIbTRBGOzHaiiho+vaT3kEJMQKcBprRiszmllm2l2STIwtqslVW1L0SOl74CO9TuZRa6HulAxg7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQs+NywK9I2AwBcH3MlM8BKPW5Vzku6glFriloCVQ2E=;
 b=DqA0Et4KXujghrQVY4yoEFdAEQfL4yPfwSRolTo5XImSImInKr/05RtT381HLQHb3oTxHbxZ9bpsDXjq223uvpd1u7jo6d6f1xeEA7f3u0fJI2zaMyvaHSzAYnuwypLvW/7W5fHIcgNGTFK7RBmANA/6HXVGZVxuS4gibqR+1pI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:384::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:31:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:31:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:31:00 +0000
Message-Id: <DFYK3HM3V26I.3T604PPDDGWNF@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with()
 and friends
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-11-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-11-lyude@redhat.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fcbea9-dfec-49df-0fd6-08de5cdf2594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1ZCYXZoUVRCOEZiVG9Lc2IxQ0FyL29nenJlaFFHc0ZmWmJCU0JpMHFQdkYx?=
 =?utf-8?B?dTNwcGVlZWNxdW9ZVzhMblZXeEdKWHdtTzBZYTRzdWx6ek8xYy92K3VVM0x3?=
 =?utf-8?B?MGgyWHAxamM0M2MvejFuRnp6cXFNSUs3Q1RuSzFBQjZBNS95dUJDRXIrejFN?=
 =?utf-8?B?SFhPdGkwTXJtZnV6QmlKYmg0QkF3WDJKMEtSRHRReVhndXFkRWtzMHU5dWJm?=
 =?utf-8?B?SVhhbmRMa204bTB2NHhZbVhQaDJUblNSZE1ReHhvYkZUNXAxMkQ5S2RXbzEr?=
 =?utf-8?B?aE9TUzlLUStMYmlvbU5GVFVOTFNTMDN2R2NMM2Y4TndDRWo1b0RBZWcrZzJk?=
 =?utf-8?B?U0tPSmtaeHVPNEFyVnAwY3krUFNMeUU1aUxwWGFxZHNqOTd0b29vOG5UWFYx?=
 =?utf-8?B?UFF5VkRuVHdocC92SXBoUHR5cmxueHRCbWlhRWthR0pycU9SU1N2MHV3cDEz?=
 =?utf-8?B?VVBsczk0T3FKdHdiNUtINGFWckdMejhkdlhOajV5VlpLVXpaVXJLbEdZUSs3?=
 =?utf-8?B?QU1lZXhGTXF6bmdNYll4cEZQTWwwbHhhaUd6SU80WndiYmR0ZWM2RkpqTkJO?=
 =?utf-8?B?bEF3LzJ4NFk0eUpjTTM0bXlwVHhRUHNPY0dSN3lQemZuVjljbHp5ZlJYWkND?=
 =?utf-8?B?OFBuck0rWUVLSHJpNW5vQXRNeXN2VUw4dW5JVjMzWjczRks3djBIN1pRWjNW?=
 =?utf-8?B?anRldUw3WjJ1VFBxWGM4LzFRUHFZekZOayt3cUhuSHhFN04xNDZBOEQ5VTJw?=
 =?utf-8?B?d1ROSW9vMFUvTEV2YTQ5WWJWSXo3OGpuL2gyOC9OSnVyQUpWRUU3ZDJMWXJ0?=
 =?utf-8?B?cEhRd0wwcUFZbW9FcEtBTk5ycFNpOWJNc2E4bjc2Ulo5d3o3Y0M1SGc2bmNS?=
 =?utf-8?B?MVF6UTFVVnI1RCtOWndmTGFWT0ZjME9SdExQdSt5NXBFajRTaERBcjV1TkFY?=
 =?utf-8?B?RXM3M1dDUnlpWEo5NWRYM3ByZER2UUttVTZmd3lyK0hTdFZ2TkNBQnRwcFh6?=
 =?utf-8?B?ZjFoV0ovclM5aS9Ca0ZDV2YvUFl6UnFFZ1psZ21pczNWWWNad2tHaVFURjEr?=
 =?utf-8?B?cFQ0aVZadGlTb3Jnelc3VHZMOVRFdnY5UVIvUGJscS94Um05eDVvM0tjV3BQ?=
 =?utf-8?B?NHlEYS92OXUrenZKNEJzSEdhS2d0UHpFTGtqanRHK1oxSW4wOEVZL2V4R3lv?=
 =?utf-8?B?Q1ZnZU1NZjFNcHZrSlhuL1RPbjhyeE5oMFByUEQvaGZVOGVBdW9URHZ1d3Zl?=
 =?utf-8?B?cFlpcTJMNVN4WWluYkhOblA3MVVhS1dQRXJOZTc3MFlNYXpiWnNXdE9HdWVq?=
 =?utf-8?B?Ui9udFNnUVdrVzcxaHpJSVlIdk9tcmcwN1c3aWRTUkE0elBCQ1lBY0FJTTJV?=
 =?utf-8?B?RzRFT0JudUhHd09zUndoSlMxUDZleExZQ1djaEUwcVBpLzFEcy9FTkhLRUFt?=
 =?utf-8?B?ajJSU0FvNzgyU1UzMjFhY3M0UGduQUgvbitvSUprVVhxRUR3Wm5NMmNhNnY4?=
 =?utf-8?B?bW5MS3lCVFI0MVM3YzlVNTQ3WGdhU0JkOGZvTWdXZjFkWHhKdjlMSi9oZ0pl?=
 =?utf-8?B?WVFMUTBEZnl4VGFIbUsza3R4TTRjcWtERWRzZ1NEYng4SkJUWE0yckFnMGFx?=
 =?utf-8?B?NUZqTWFPYnBxamVNRTQxZDZ5Wis0U3NVM2dENE9GK1NUQmxCcjBLOGZCQjh2?=
 =?utf-8?B?bmNmTzJqL1FOTm5PQjBta2kvRE4rKzJESFNSem1BNlJ5WVhVeUUvUy84WU9Z?=
 =?utf-8?B?VG9yWmNMRVFIQ1dMTjZZK1VOTkh2d2V5RXNPYzg2WnV2L3h2R2hMNlkyaFlX?=
 =?utf-8?B?aldXZm80cUh2VnBLUGFNaFNGOWpWZXJSRHY0NitRWE9qSHZhUGpEVXJ0M0ls?=
 =?utf-8?B?WmZYWVpaQTl5cW1ERDJOUEdZZVhwclhTVTFGa3E3OVJwT2RRNkV4UnpwMWJ3?=
 =?utf-8?B?aTc1ZGlPaFZTZDduTGsvTlR4WGtoTlVnOHhpQURnd0dMbkpRUVJpMndWY3pH?=
 =?utf-8?B?SS9CUi9GTjFjT0d1NTNzS2NEMjNLbG1Rd0FrOGxjT3d1U1Q2eENzZFhVN3Ri?=
 =?utf-8?Q?NvhE7K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3FwMFM0WHlYalhIbUpWYjhZZDBTM2RobUFyS0Z3eCtxQVVQbmNhTmE2TG96?=
 =?utf-8?B?aFM5NDRPdEFyaXAzMWR5L3lWUi8rMHU0eUVMOWJ3M2ZaYisvei90SVUrcVpr?=
 =?utf-8?B?TXBGTklpaGJvRWltMUZjTm5uL3FpS0RCK2VmaGtOa3dQRkhJN0RNTTM1VDdy?=
 =?utf-8?B?aUZlSzdwYWRnUDQ0QnhXVWt2SExxUzl6MVFzKzVyTnZvSFkrdzlna1B2clZl?=
 =?utf-8?B?TWxDemZNR2VSWlpYSVNGYlF3ZlZiVGFoOE9GSUFnY1FuY3RFMFk0NXZ0NEtH?=
 =?utf-8?B?dG1YK1VNUlZULzg2Uk1kWWRkM3JSVlo4U1hJbVVNRzEydnFQL3Jzb2tyS3l0?=
 =?utf-8?B?Wm1TR0c4N2VWeWtDeE1HU0ZVZ3FYRHFoMHF4YlpzQU9SRGg5WWxoN04wU0ts?=
 =?utf-8?B?RFN0TUNEZ1A3N3N5UzRyZ3pSSUJJZmhFVWtwNTVZQ1U4TGpLdzVkRWlaVXZH?=
 =?utf-8?B?LzJPandkY1hjZEFwY2hhZUlWQm5BTjNlWk9JRmJGZXhqbnRieVd4dWp4bHRq?=
 =?utf-8?B?WXBVc3pCaStFM3c5c0ZZV0ZHa0pGM1hsQ2JsbUJhL2JmT3M5dTJMV2RLWHJL?=
 =?utf-8?B?N1ZPZFZVa1g4Tll1RUtpMFAvVGxDa0dkMWswMExZcmZVU0xKUGVaem9VSzZY?=
 =?utf-8?B?VU0vcXBXY0VQNUlGS0NzZFlaTjZ6cCtNbE1GWU83V3hLY1o3cGtrMHc1dE9x?=
 =?utf-8?B?UTlmVDRmSy9sZ1EwMGlQdlNjM3NuN3ZTNFc1UTJtNjVRL2VTMGdXVjg1RjhQ?=
 =?utf-8?B?UUt0aXUzcUU4aFVKaUJlRVp2TkMzSk50YXdlMTNZSnVYeFZlNTh4ejlEUzBk?=
 =?utf-8?B?QUFnc3dMTHlyemxsVy9mZFp2Zm5oVlpaeWZLNG5vak5aUEZ4dmt6OGxlQzUv?=
 =?utf-8?B?VWxxTy9HamRkVXllT09BMkJNZ0hzNm94aGxxZkEwSFhvdktJaUxtZlEvMWFa?=
 =?utf-8?B?UDJSSVNicDg5ejNpbSt5bk1FdGNtU000OE5sWkFlampXcnl4MVVEY25Randj?=
 =?utf-8?B?Tk5BZDRBb2oxK0s2eDBSUlYxYTJYZ0JBVDFaMm5UdWx4Q2N1OVJaNElubkNZ?=
 =?utf-8?B?cjQ0eFRVbyttOXE4SndhRE4vdngvUlZ0bVhBWXhQQ3NBWmQzUC9xeDZRWHc2?=
 =?utf-8?B?T3NIVTJ0MU5pcGhBSFNqQldPdXdFMUtDN3p3VEZFUC9oaTBSblRiZVF2eUNh?=
 =?utf-8?B?SHJyMW02SVl6N3R0YzhUeCtjOTlvbzZqNlFKMFVUQUVYZmhNSytHcDN2aUw5?=
 =?utf-8?B?aWs5UGE1VE1CeHhSd21ibUJxb1QySmFwbjlzZFZuSStFV05NMXZxTjdjSHVo?=
 =?utf-8?B?VDkrVkxQekk4VXlYeFdlYktUeU5kanNhaDJHVUZiZDZoeXRja0R2Ym1ROFlF?=
 =?utf-8?B?TzdpNzZ0YURzMnAveUV3c1RRRnd6UDQxNjI3ODRndFNGN0pqN2hiNzJnWU9y?=
 =?utf-8?B?ZkhDRkdMazVUcy9uSWp0UWcwc0plUmlBYitncXl0SnFWN253VXBqR05YdDRw?=
 =?utf-8?B?eUpsQUhMbkljOTVNTGtNRnYrdTFTaEErZEN5bUU4VEc4L2luakhpR0F4ZnpK?=
 =?utf-8?B?QVNNaHhDZ2hsS2pZZEg2OFBKUDNSN0VidkEwUk1ZSzhLSUhESTdKQlZ4aUNT?=
 =?utf-8?B?dkE3ZENvVjVkN3RVTVRGS0JKQlhBQnJHUXo1TjJlMHVZM2J3NzRHem1xSEJB?=
 =?utf-8?B?RmpYYU9CTEQveTAyY0NDK3ZHTXpqOVZDOE5SbHo3VXp3VDNCSlhNYldHbVRQ?=
 =?utf-8?B?czYvRWlya3pPc1RmNE8wc2w1ZGlRUXgvWm1BNlprN0tVQW1rMmpKLzViVS9S?=
 =?utf-8?B?bVBlL2xyOVNNNHZlSFlkeThjTUtIc1VzYWx0Zmg3c1hVZTV2dWpkREpOd3BD?=
 =?utf-8?B?Ny9lOFB3Q1lRam9ZSGJCMDlJQksyYjBOeW9QTEpoSWg4cXNYR25aTUlnZTQ5?=
 =?utf-8?B?ZjVpMVVCVDNzc2M1amlZUmdQeTZQbW9CYng5N2FMeGJrT3VwWVFCVkxDYUF4?=
 =?utf-8?B?UlZqcnRMQnNCRDE4TFd1MlRDbDA0aW5odTJHRTByQ2N3TTF5cGhRZklDZ1Vp?=
 =?utf-8?B?SVh2SXVqOGJoOWNkbThjV2NHNGRQcWluTUszaGNPNUk4M054TnhuQlZaVkxT?=
 =?utf-8?B?MW9EdlgrSUhUb1dlMHJOeVpkMHduaGJxNXZMcnErZEJmL3VsdThuY2J2MjZL?=
 =?utf-8?B?SUR5dWorVWtGMVFiZC9KK2lDdzV0NlpGZ2Y1QS9yM21CSjdSTEc4bFdhaDI5?=
 =?utf-8?B?VlpyUGJ1blUwOTkzeTRUYzArU2ZBRDZ5T3Y0RlJZYkxWME1PM2RVeDA1cWQz?=
 =?utf-8?Q?dDFA9yziWqwW/HAMvS?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fcbea9-dfec-49df-0fd6-08de5cdf2594
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:31:01.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/0qgCzyly/NsLiLoEZM176nWMIGkkPdNoUeaI99DNf1j6L32SG5APgzJsLTFc9QdAJi96LvApPe6Y7HI4CUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7279

On Wed Jan 21, 2026 at 10:39 PM GMT, Lyude Paul wrote:
> `SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
> with the only real difference being that the former uses the irq_disable(=
)
> and irq_enable() variants for locking/unlocking. These variants can
> introduce some minor overhead in contexts where we already know that
> local processor interrupts are disabled, and as such we want a way to be
> able to skip modifying processor interrupt state in said contexts in orde=
r
> to avoid some overhead - just like the current C API allows us to do. So,
> `ContextualBackend` allows us to cast a lock into it's contextless versio=
n
> for situations where we already have whatever guarantees would be provide=
d
> by `BackendWithContext::ContextualBackend` in place.
>
> In some hacked-together benchmarks we ran, most of the time this did
> actually seem to lead to a noticeable difference in overhead:
>
>   From an aarch64 VM running on a MacBook M4:
>     lock() when irq is disabled, 100 times cost Delta { nanos: 500 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 292 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 834 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 459 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 291 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 709 }
>
>   From an x86_64 VM (qemu/kvm) running on a i7-13700H
>     lock() when irq is disabled, 100 times cost Delta { nanos: 1002 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 729 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1516 }
>
>     lock() when irq is disabled, 100 times cost Delta { nanos: 754 }
>     lock_with() when irq is disabled, 100 times cost Delta { nanos: 966 }
>     lock() when irq is enabled, 100 times cost Delta { nanos: 1227 }
>
>     (note that there were some runs on x86_64 where lock() on irq disable=
d
>     vs. lock_with() on irq disabled had equivalent benchmarks, but it ver=
y
>     much appeared to be a minority of test runs.
>
> While it's not clear how this affects real-world workloads yet, let's add
> this for the time being so we can find out. Implement
> lock::Lock::lock_with() and lock::BackendWithContext::ContextualBackend.
> This makes it so that a `SpinLockIrq` will work like a `SpinLock` if
> interrupts are disabled. So a function:
>
>         (&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLoc=
kBackend>
>
> makes sense. Note that due to `Guard` and `InterruptDisabled` having the
> same lifetime, interrupts cannot be enabled while the Guard exists.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>
> ---
> This was originally two patches, but keeping them split didn't make sense
> after going from BackendInContext to BackendWithContext.
>
> V10:
> * Fix typos - Dirk/Lyude
> * Since we're adding support for context locks to GlobalLock as well, let=
's
>   also make sure to cover try_lock while we're at it and add try_lock_wit=
h
> * Add a private function as_lock_in_context() for handling casting from a
>   Lock<T, B> to Lock<T, B::ContextualBackend> so we don't have to duplica=
te
>   safety comments
> V11:
> * Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
> V14:
> * Add benchmark results, rewrite commit message
> V17:
> * Introduce `BackendWithContext`, move context-related bits into there an=
d
>   out of `Backend`.
> * Add missing #[must_use =3D =E2=80=A6] for try_lock_with()
> * Remove all unsafe code from lock_with() and try_lock_with():
>   Somehow I never noticed that literally none of the unsafe code in these
>   two functions is needed with as_lock_in_context()...
>
>  rust/kernel/sync/lock.rs          | 71 ++++++++++++++++++++++++++++++-
>  rust/kernel/sync/lock/spinlock.rs | 48 ++++++++++++++++++++-
>  2 files changed, 117 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 46a57d1fc309d..9f6d7b381bd15 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -30,10 +30,15 @@
>  ///   is owned, that is, between calls to [`lock`] and [`unlock`].
>  /// - Implementers must also ensure that [`relock`] uses the same lockin=
g method as the original
>  ///   lock operation.
> +/// - Implementers must ensure if [`BackendInContext`] is a [`Backend`],=
 it's safe to acquire the
> +///   lock under the [`Context`], the [`State`] of two backends must be =
the same.
>  ///
>  /// [`lock`]: Backend::lock
>  /// [`unlock`]: Backend::unlock
>  /// [`relock`]: Backend::relock
> +/// [`BackendInContext`]: Backend::BackendInContext
> +/// [`Context`]: Backend::Context
> +/// [`State`]: Backend::State
>  pub unsafe trait Backend {
>      /// The state required by the lock.
>      type State;
> @@ -97,6 +102,34 @@ unsafe fn relock(ptr: *mut Self::State, guard_state: =
&mut Self::GuardState) {
>      unsafe fn assert_is_held(ptr: *mut Self::State);
>  }
> =20
> +/// A lock [`Backend`] with a [`ContextualBackend`] that can make lock a=
cquisition cheaper.
> +///
> +/// Some locks, such as [`SpinLockIrq`](super::SpinLockIrq), can only be=
 acquired in specific
> +/// hardware contexts (e.g. local processor interrupts disabled). Enteri=
ng and exiting these
> +/// contexts incurs additional overhead. But this overhead may be avoide=
d if we know ahead of time
> +/// that we are already within the correct context for a given lock as w=
e can then skip any costly
> +/// operations required for entering/exiting said context.
> +///
> +/// Any lock implementing this trait requires such a interrupt context, =
and can provide cheaper
> +/// lock-acquisition functions through [`Lock::lock_with`] and [`Lock::t=
ry_lock_with`] as long as a
> +/// context token of type [`Context`] is available.
> +///
> +/// # Safety
> +///
> +/// - Implementors must ensure that it is safe to acquire the lock under=
 [`Context`].
> +///
> +/// [`ContextualBackend`]: BackendWithContext::ContextualBackend
> +/// [`Context`]: BackendWithContext::Context
> +pub unsafe trait BackendWithContext: Backend {
> +    /// The context which must be provided in order to acquire the lock =
with the
> +    /// [`ContextualBackend`](BackendWithContext::ContextualBackend).
> +    type Context<'a>;
> +
> +    /// The alternative cheaper backend we can use if a [`Context`](Back=
endWithContext::Context) is
> +    /// provided.
> +    type ContextualBackend: Backend<State =3D Self::State>;
> +}

The dicsussion on Zulip seems to arrive in a consensus that we want to avoi=
d
generic approach at all and do an inherent implementation on
`Lock<T, SpinLockIqBackend>` instead.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/Spinlocks.20with.20IRQs.3F/near/564176443

Best,
Gary

> +
>  /// A mutual exclusion primitive.
>  ///
>  /// Exposes one of the kernel locking primitives. Which one is exposed d=
epends on the lock
> @@ -169,7 +202,8 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a=
 Self {
> =20
>  impl<T: ?Sized, B: Backend> Lock<T, B> {
>      /// Acquires the lock and gives the caller access to the data protec=
ted by it.
> -    pub fn lock(&self) -> Guard<'_, T, B> {
> +    #[inline]
> +    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {
>          // SAFETY: The constructor of the type calls `init`, so the exis=
tence of the object proves
>          // that `init` was called.
>          let state =3D unsafe { B::lock(self.state.get()) };
> @@ -189,6 +223,41 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
>      }
>  }
> =20
> +impl<T: ?Sized, B: BackendWithContext> Lock<T, B> {
> +    /// Casts the lock as a `Lock<T, B::ContextualBackend>`.
> +    fn as_lock_in_context<'a>(
> +        &'a self,
> +        _context: B::Context<'a>,
> +    ) -> &'a Lock<T, B::ContextualBackend>
> +    where
> +        B::ContextualBackend: Backend,
> +    {
> +        // SAFETY:
> +        // - Per the safety guarantee of `Backend`, if `B::ContextualBac=
kend` and `B` should
> +        //   have the same state, the layout of the lock is the same so =
it's safe to convert one to
> +        //   another.
> +        // - The caller provided `B::Context<'a>`, so it is safe to reca=
st and return this lock.
> +        unsafe { &*(core::ptr::from_ref(self) as *const _) }
> +    }
> +
> +    /// Acquires the lock with the given context and gives the caller ac=
cess to the data protected
> +    /// by it.
> +    pub fn lock_with<'a>(&'a self, context: B::Context<'a>) -> Guard<'a,=
 T, B::ContextualBackend> {
> +        self.as_lock_in_context(context).lock()
> +    }
> +
> +    /// Tries to acquire the lock with the given context.
> +    ///
> +    /// Returns a guard that can be used to access the data protected by=
 the lock if successful.
> +    #[must_use =3D "if unused, the lock will be immediately unlocked"]
> +    pub fn try_lock_with<'a>(
> +        &'a self,
> +        context: B::Context<'a>,
> +    ) -> Option<Guard<'a, T, B::ContextualBackend>> {
> +        self.as_lock_in_context(context).try_lock()
> +    }
> +}
> +
>  /// A lock guard.
>  ///
>  /// Allows mutual exclusion primitives that implement the [`Backend`] tr=
ait to automatically unlock
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index 3fdfb0a8a0ab1..e082791a0d23c 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -3,7 +3,7 @@
>  //! A kernel spinlock.
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
> -use crate::prelude::*;
> +use crate::{interrupt::LocalInterruptDisabled, prelude::*};
> =20
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
> @@ -220,6 +220,45 @@ macro_rules! new_spinlock_irq {
>  /// # Ok::<(), Error>(())
>  /// ```
>  ///
> +/// The next example demonstrates locking a [`SpinLockIrq`] using [`lock=
_with()`] in a function
> +/// which can only be called when local processor interrupts are already=
 disabled.
> +///
> +/// ```
> +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +/// use kernel::interrupt::*;
> +///
> +/// struct Inner {
> +///     a: u32,
> +/// }
> +///
> +/// #[pin_data]
> +/// struct Example {
> +///     #[pin]
> +///     inner: SpinLockIrq<Inner>,
> +/// }
> +///
> +/// impl Example {
> +///     fn new() -> impl PinInit<Self> {
> +///         pin_init!(Self {
> +///             inner <- new_spinlock_irq!(Inner { a: 20 }),
> +///         })
> +///     }
> +/// }
> +///
> +/// // Accessing an `Example` from a function that can only be called in=
 no-interrupt contexts.
> +/// fn noirq_work(e: &Example, interrupt_disabled: &LocalInterruptDisabl=
ed) {
> +///     // Because we know interrupts are disabled from interrupt_disabl=
e, we can skip toggling
> +///     // interrupt state using lock_with() and the provided token
> +///     assert_eq!(e.inner.lock_with(interrupt_disabled).a, 20);
> +/// }
> +///
> +/// # let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +/// # let interrupt_guard =3D local_interrupt_disable();
> +/// # noirq_work(&e, &interrupt_guard);
> +/// #
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
>  /// [`lock()`]: SpinLockIrq::lock
>  /// [`lock_with()`]: SpinLockIrq::lock_with
>  pub type SpinLockIrq<T> =3D super::Lock<T, SpinLockIrqBackend>;
> @@ -283,6 +322,13 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
>      }
>  }
> =20
> +// SAFETY: When executing with local processor interrupts disabled, [`Sp=
inLock`] and [`SpinLockIrq`]
> +// are identical.
> +unsafe impl super::BackendWithContext for SpinLockIrqBackend {
> +    type Context<'a> =3D &'a LocalInterruptDisabled;
> +    type ContextualBackend =3D SpinLockBackend;
> +}
> +
>  #[kunit_tests(rust_spinlock_irq_condvar)]
>  mod tests {
>      use super::*;

