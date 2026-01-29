Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021105.outbound.protection.outlook.com [52.101.100.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77137F0EB;
	Thu, 29 Jan 2026 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769695846; cv=fail; b=mo/iQjqdyHHQDeie4JWa4/iY1snj6WsjWTI3WQYrLHTyxGiL8XpVtf7UT1h+cifdscNWUpz9Xy3ZENUve0wsM8Rlyw4sKKqJZLuR4v6/O2fXQRCfCnmTZ46beSQpS1I+2qq3KwF9aVS/oOf4KIy05GkGDSdSXYuOO34pj1xo2IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769695846; c=relaxed/simple;
	bh=vaXO2HQ19EAOY+5kM47SHSndzgMslm5Y3qHg3I2jhL4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=O/QV7XeGF3KzQyGgvihtjoh9xi5IOWeq2XbMIyTmcmbn/uIDI1lERQO6lYloKc6oR8BmmZVKMTmSh2Ogjx3x2JWUqwvVzWtDX++xYbbnU0r8LZYpppHX+sLOF8VrT4N5bvrwsFQwjNnsabIYFTwMic2soJZOUk7f+DnGVH6xA7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Y1YsO0F7; arc=fail smtp.client-ip=52.101.100.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Y1YsO0F7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P53LwQBb48L4B7GkwMo9j/Wm+PPjrYkipwyBG7C2R0wbhneqDIBYseuGiLM+7us2qbfOZjnPJFd/p8N0qrEZ2IRs3KbzR8h/KF2gp78Op7Fp8V1nOd4TzeNznrE1M9ZILK5dJq3hBrdxFCpEhlC24pkLMCUtfDDGvAS9OeUc4ygoABRdEvbk0h0BsZMFoFMAmO6/cmRR8f1ZoWK1MM76U/rcmvlNR8TsU3GtbbgqUqJqXisu6E7xKgOmqi5lW04EVJHFIxaXD2lKC8g4vw3AXu0jWEK3j6rs5ye0Zxna4EjjJ9YnAYpVYMLznGFQlI6nQqjTeeEAzGOqpXyVxNeHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9qN7K7gTPVlPvJ50TukBYbnldYiQFtZd8R7YjPuEOg=;
 b=Jh8eA9ek6Pj17xIFeT8HK3/R9JeTEHC/TrHBweUDlsz0+Ch4BlIoZx9Nh4masadmdjSW+R649BKwDMb56vuSuKGowa+9HnayCllKcDGWFz4Px3VDNWyfQW6GGFNJ/YOx3WQmmXYXbUIRlCCtoM5N1K2g6ioa8fPaAJp4SwhFDAFJGreNkTnjnTuSYL3JbUzA9QtyonQUZUcN2d05RfXc/2d7jy3MBPjvfaDiVn98/HW66wejWmjFdP35CncH2pgh4DdZU0VoSM8/8GBKEj7W41LCMBXp06gp3xui7me8ajUIjfTVrLcp6Kk1ApKgnjEgesdeKxitWyrEirqKPn812A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9qN7K7gTPVlPvJ50TukBYbnldYiQFtZd8R7YjPuEOg=;
 b=Y1YsO0F7KQChxBoUpCqLzOoS//qqddXblB7YGSieVxfleueOE8Y4207q4o+hYE9MWeRXEkg3RMmP+jIoureTtYk2AzrJ/7f1279SBudAA3mZmBaBAUe9/Es3E58SaBbV9wErI/GicjMVHALtpqEtCTTRk3qPFAySr4Bszhakt70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8823.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:489::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:10:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:10:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 14:10:36 +0000
Message-Id: <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
In-Reply-To: <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
X-ClientProxiedBy: LO4P123CA0642.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f500916-967a-4e56-ef23-08de5f402cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEhra3ZmNktjNzJlNFJGNW1QTEpycXUrY2tQb3hIUXVJYy9KV0RNVUlnMEJW?=
 =?utf-8?B?VXk3U25pNGNrMXFTN0VlZTdDS0tpaFJBV3FxSXBIdzhrbjRMKzg4N0tmamJ2?=
 =?utf-8?B?NnBLc1BNblFlZTBsdnBvVVFsVGZoTW80SkY3V0ZQNmx1VWNtK0FyRnd6WSs5?=
 =?utf-8?B?RWZHNzE5NFhDMWprTWVqdUZoY3hoL2NlS1dxZ1c0QkFsKythMytNaXZjczJx?=
 =?utf-8?B?OEgrL1ZvWHIrUkg3Q2JmU3BSN0FubGs2ZytBTWZodVlnejR3SlVFVVVHekVC?=
 =?utf-8?B?Qzc2N3NxNVdjUE1aRmhndjVFRDZmZWhqN3RLVG9lWk54M25ObnM3TXkxbWJS?=
 =?utf-8?B?SVRRNkQvRWc3SDRhc0o5SXFIVzJrZnVSQXl2cFdNK2NLRU96c2VHRzkvL1dU?=
 =?utf-8?B?cWY0azlxamdRR3Z2amtUQkowSithOG1WRmcwRUYwZmh4Tkp5eXdRclRPL2dy?=
 =?utf-8?B?SUxzdk8vRXJob2Jwd0gySk5BVDRScUo4S3VhSkpBc1YrQVdRTTM3d1hmdldE?=
 =?utf-8?B?UDVSQ01jQ2ZMM0YwRWVFLy9GdlNLL3BDbUVKbVJQUHFNVzRUSFdwUUY0NXE3?=
 =?utf-8?B?VXpCMjl6MlhVSEtuUjUvbU5abkh2Y1JBVVF5K2hzb3FOOXkrSkNxTE5WT2lD?=
 =?utf-8?B?Q1N0M21ZNnVWeHluTVJDMElMdUZCRW10V3NaR04xcmF3MUh4QThVNGU2V25P?=
 =?utf-8?B?ZHlIcGkrSnBONFpVUGRPRm9rbWxPcStCZkJieEhTR21pQmo4RzVVQWlXS1ds?=
 =?utf-8?B?WlNtaENlNkpQRENVajgzOWFLamJFblVmUHlKTVFIT0VLN21sZStrVmVkcVl5?=
 =?utf-8?B?VUQ0Vm9kaWJoRWNVZ3RlMWFlS0R2ZDIvV3FwbXVjVjFhQ1djZEhHaHFOSkJU?=
 =?utf-8?B?OTUvbzJBdG92ckNLQXExRFV2ZzlKNndrSnlzcHdaRkdMOVFpdEFtY3dLWmpB?=
 =?utf-8?B?UjYvL3VDL2huV2tEVXFjeVUvSHpucWIvVy9YUDhzY01ScEk0VXdxQW1CQUpy?=
 =?utf-8?B?RzBZY3VQdnNWQi9HcHBmbHVXVFYxWHQzTERiMGNsOE1uRlZEcmVad00ydTNE?=
 =?utf-8?B?Q2kreTl3VENOSkNOM3IvM2l3aGlxV0FBZU1KeHpJeXUwQ2Vsamg2RmNXZXJJ?=
 =?utf-8?B?d01VTE9tYTQyV2FuMW9hMXAyaEtBbjZYdEwwOGFJR2NObjg4WWhhTnE5YkpX?=
 =?utf-8?B?TkNPZFFmbXpWNThGRVY4bUF1V1lOdk51cS9BcVB1dnd2Wm5RZHVsUUphclFE?=
 =?utf-8?B?ajNlR3gxREs1ZkZlMmdSc0xHbGpzREwzYmZuajIwS2t6L3hVTEF5UGlGaFcv?=
 =?utf-8?B?UkJBeGZYUGFDdnJ0OXpjdFlRcHZjRHFOaVE5LzhhbEhxb05RWVltRi9TVUR4?=
 =?utf-8?B?V1krOWlGUHBqZGtwVlg4bzFCNlM5TTVWSUJRV0V5YjNWRHhxcTBGZlVhTktm?=
 =?utf-8?B?U2hsd1dIY0QvZjNnTzRZYklnMC9QNTZKTG1ZOURHUDd6STkvM1lOV2RIdC9r?=
 =?utf-8?B?UEVDZDB3eDJHREhxVzRoeVpxNDdTaTFkQjlYY00zV0J2VVJrdCtpQmZLRDBU?=
 =?utf-8?B?ZXNiZlZtQ3N3cmxFK1ptSlpmMVRTNFpFQ2ZkVHZLTWU0WGU4dGs1Ti9IdGk2?=
 =?utf-8?B?ZmhDQXVneXQ5ZCtVVDlldkNidXE5cTh1MUVVbkRMdlFObVE1cWNsVGdlR2Fs?=
 =?utf-8?B?c2I2b2JGTEhBNHp1V0JYRHlTQngrT1Urd1Jrdnd4VU1iWUxETUt4UFMzL2xx?=
 =?utf-8?B?bmFWM0J5MGwxQzlhcXlPajlJWTNNeTRQZ2lHRWxES1ZuWDNWZ09qNzZ4QkQ3?=
 =?utf-8?B?RVJjOWtONk8zT3JaMjhtK1J6dVE2anhZV3ZEZWlLNWxkd09MbjRYekVxWEZF?=
 =?utf-8?B?cnJpT1hnbXk0MVNOTTZMWWMrLzVjdjNtY3F4WDgrMTdma1VKRnBMbHRaOHJI?=
 =?utf-8?B?a2RkWVBFaVJLckJWTFFoNjRoQ2hOQjNicUJrSDlpZk9Fd3U5UEFpNU5vK29p?=
 =?utf-8?B?Y2lvTHhOczRUeE00SGpkQXVDbDh6VDJ2K3VzOHJUWTYvdjI3ZEs3UWlLdE4v?=
 =?utf-8?B?N0JKYTQwVzZjZHVVVnh2SXNqMTdxaXFPbTYxTEptSDBlaVdZb1NMaElOOE50?=
 =?utf-8?Q?5Dn4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBMazlvZHYzdlR0V05PRmRydEUzd3N2b0M3dWhVZDF1Mis2aHVqV2tEZkNQ?=
 =?utf-8?B?bFpqdUlzUVhIeERNMXMvSXNWd1pzZkp1eFlXMytYZ1Rya0VTSk13UnhGZXlO?=
 =?utf-8?B?Um9mOXNEN3hodGpPcHBvMm5RaUJtY2VDaFNlaUVIeFdhL2x5UVhMU0c5OHVl?=
 =?utf-8?B?M05LaHFKdTVCWDNwMC9ocTVhZWp1ZW1UUnJYdjJMMVpyQm9uVm92N2hFVDIv?=
 =?utf-8?B?TVN1UEpEM1FUNVgxbWlZdk9Xa2x5RithNDREQmRGWllyL3lKNlVOV1paeXlW?=
 =?utf-8?B?NGFYZ0tUUVN2VVoyOTdidTFiYnNZbzRWdXB2QW5kOHpxanBYdlBDaTYvSWY1?=
 =?utf-8?B?MjROVi9EL2Nvb21xYlgvTllmZ2liZ25uZGttWTlwdFBIMmlqUXFSZGwzaGlR?=
 =?utf-8?B?Tjg0MjBwb3QwYytIR1lFTU1oWUFVMWVxNkxpNjJCcHQ5bnowUGNGc2o1c1N6?=
 =?utf-8?B?aWRUclY4VkprdnhtQTBqMXVyV0E1ckpwallqc1lxMVNiZTFSNGRnZ2xEVnUv?=
 =?utf-8?B?TUNOSWowYitRdU96bHRFTU8ydmJjYTdBMGkyMlJiMU03Q2R5SVZPMTdSS2JM?=
 =?utf-8?B?NlBxS1JReVB0YjBiNGE1b3gwNjhUWmVTV1dlclJTUDRzNEYrSG9uWEQ1RDdL?=
 =?utf-8?B?WUpaWXk2aHdSdTR3N0F2QnR0L0N2VzhvUVp4S0ZLYnlSMEU1MmlyVWlwZEF5?=
 =?utf-8?B?TC9zODRqblFIc0F5YnJDU0VTbEx1UTk3d1p2L2d6MmZtYlRWOXFTUFJkZXpF?=
 =?utf-8?B?SUZRQVdwYkRNc0dPRjNnbkYyZjk2NGFrUmZBM245WXlQUEhKeDhwS3pReHVO?=
 =?utf-8?B?dVhKZWNlNEErQktVa3lYcG0yQm5OMkQydkFTQzFBR2RyWU9DZHh2b0h1a2dV?=
 =?utf-8?B?d21YZlROMTFmWEUwRE82YkovVnVXZzIxYkl3UXBHKzBXNlBtbi9xdnYvZm83?=
 =?utf-8?B?RUI0b21lYzhKc0VIZDdidUdvMVJ0blR6WDdubDhPL05EdVRLdEp3dmxtelRH?=
 =?utf-8?B?WERBNXdFUjh2TlJSUEw4WGVFMEx6N3hvWWdLOUt5RE5WOXFhR2h2SCt4bnlG?=
 =?utf-8?B?bDBTSy92VTNaZk92Sm51QVgxMk8vRDYwMnlBemYzY2RJdlN2YTRQcDRUQVc0?=
 =?utf-8?B?TUI1ZVROcjhqV1kvMFRwTUh1MVZPVWN1UU9vU25lY2tJQjl0dHpzaHMrZjFq?=
 =?utf-8?B?emdTRHhZbC9qK2VsdHVNbjRJNTZXSnhmWXdxNFI5Y1Z4RlYrRUU2UENDS0s0?=
 =?utf-8?B?MElJSUV1eUFDKzd6VlZlUlVRek1FTmhlSEttMXRKQ05YNEdQQkpMQTMvQzBt?=
 =?utf-8?B?T1l2ZEt3T1dHamxkNFhBeTVHYXBTN0QybDNpTjVUUEZVcTQrRm5MeFBPbTlG?=
 =?utf-8?B?c3lFQlE4UVlBdllweCt0MlZlVFNkNXRWMEtMQmI1QkZVWStuZjR5Q0J1MUZi?=
 =?utf-8?B?TjFIMENzWFNxeStNSHhDcFJPeHJQOWNpd3BLRUFKUWFCanR0eTNWdkgrdzZZ?=
 =?utf-8?B?c3RsUzdhUzBWeklGenZEbHFvR3pTN3FTRDdvK3RJOCtLWDZwa29IbE9MNHA4?=
 =?utf-8?B?ODZrWUhHUXNKL3pMSFI2VFFLL29ZandPZ05aN0c2VE1ndVlXOVRqS0pwVGw5?=
 =?utf-8?B?dUhYczM4MGNDSUxsczJhOXcydGpIZmx3TWRscHFNS3hzaklWSVVmaUZiYTRh?=
 =?utf-8?B?aGtNRlVOdm9ac1JWd1JsNUVwTzhUd2R3MUtuTHRncVZoelVHY0dBRXJFTnlM?=
 =?utf-8?B?ZlZadTJwZ3FOZjJTc3pIVThEbDA2OTlMNXVNS1crTWRaMDVOdVBGM3hVeWQ5?=
 =?utf-8?B?bVpqdnhVbjNEQ0YxcW1sSVRBejFic2hVSlBiaFB3RTZ5eEZ4OXNTWWFjaGZm?=
 =?utf-8?B?UlBoQXNuWW42YWNnaFp3cGw1NUdwWnlCK211MnJZVFFwaWdJSGNwdUh1RC9H?=
 =?utf-8?B?clRxZlAzM2pYb285MDRtb1lwQU5WcURsa0hua202UEMrU1ZRRDBOSElKbnNK?=
 =?utf-8?B?cWFYQ0pZVWtTVVZPNmk5RzJEQW0xeDZ1UStUZUp1MWlNdTV3TTdUYkYvRDN3?=
 =?utf-8?B?Yno0WDJRR0tRR3JlSTMxMmJTWkxTbDRpVGNabldxejZwL1psRWg5RWtUQ21r?=
 =?utf-8?B?enNyb1BOYjlvTVdlVnpNZEVyR3BsVU4yZmRoS2ZDUmJPajQyV214d2NPQTRs?=
 =?utf-8?B?R0I0Z3QxWEVYRkhMOFZrdVdJcjEwbVlzbFFXekR0bGQ3UkU0dDFsYlZpMnQ2?=
 =?utf-8?B?UEtmNTdPYlMrUHR6SUUyMG9BVVVrYkpzQUJYWnlNcG13QWJVeCtWVkNkVG84?=
 =?utf-8?Q?CzR+6JDy4jEewYDmyn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f500916-967a-4e56-ef23-08de5f402cbe
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:10:36.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xdqhOVf3uFiLKD5lbwsgHBvJSEqGe4wqNUurHqMW6AF+0IK0sMCjtG7z9j5tnHY4yaBdd4Rywa5AYVb+9H7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8823

On Thu Jan 29, 2026 at 8:00 AM GMT, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 1:16 AM JST, Gary Guo wrote:
>> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>>> Add a macro for defining hardware register types with I/O accessors.
>>>
>>> Each register field is represented as a `Bounded` of the appropriate bi=
t
>>> width, ensuring field values are never silently truncated.
>>>
>>> Fields can optionally be converted to/from custom types, either fallibl=
y
>>> or infallibly.
>>>
>>> The address of registers can be direct, relative, or indexed, supportin=
g
>>> most of the patterns in which registers are arranged.
>>>
>>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/io.rs          |    1 +
>>>  rust/kernel/io/register.rs | 1287 ++++++++++++++++++++++++++++++++++++=
++++++++
>>>  2 files changed, 1288 insertions(+)
>>>
>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> index 056a3ec71647..112f43ecbf88 100644
>>> --- a/rust/kernel/io.rs
>>> +++ b/rust/kernel/io.rs
>>> @@ -11,6 +11,7 @@
>>> =20
>>>  pub mod mem;
>>>  pub mod poll;
>>> +pub mod register;
>>>  pub mod resource;
>>> =20
>>>  pub use resource::Resource;
>>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>>> new file mode 100644
>>> index 000000000000..fc85dcd1f09a
>>> --- /dev/null
>>> +++ b/rust/kernel/io/register.rs
>>> @@ -0,0 +1,1287 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! A macro to define register layout and accessors.
>>> +//!
>>> +//! A single register typically includes several fields, which are acc=
essed through a combination
>>> +//! of bit-shift and mask operations that introduce a class of potenti=
al mistakes, notably because
>>> +//! not all possible field values are necessarily valid.
>>> +//!
>>> +//! The [`register!`] macro in this module provides an intuitive and r=
eadable syntax for defining a
>>> +//! dedicated type for each register. Each such type comes with its ow=
n field accessors that can
>>> +//! return an error if a field's value is invalid.
>>> +//!
>>> +//! [`register!`]: kernel::register!
>>> +
>>> +use core::ops::Deref;
>>> +
>>> +use crate::io::{
>>> +    IoCapable,
>>> +    IoKnownSize, //
>>> +};
>>> +
>>> +/// Trait providing a base address to be added to the offset of a rela=
tive register to obtain
>>> +/// its actual offset.
>>> +///
>>> +/// The `T` generic argument is used to distinguish which base to use,=
 in case a type provides
>>> +/// several bases. It is given to the `register!` macro to restrict th=
e use of the register to
>>> +/// implementors of this particular variant.
>>> +pub trait RegisterBase<T> {
>>> +    /// Base address to which register offsets are added.
>>> +    const BASE: usize;
>>> +}
>>> +
>>> +/// Trait providing I/O read/write operations for register storage typ=
es.
>>> +///
>>> +/// This trait is implemented for all integer types on which I/O can b=
e performed, allowing the
>>> +/// `register!` macro to generate appropriate I/O accessor methods bas=
ed on the register's storage
>>> +/// type.
>>> +pub trait RegisterIo: Sized {
>>
>> Is this trait intended for public usage or just internal detail of `regi=
ster!()`
>> macro?
>>
>> If it's the former, then we should probably just put the method into `Io=
Capable`
>> and allow generic-read in Io. If it's the latter, let's `#[doc(hidden)]`=
 this so
>> it won't get abused.
>
> It is an internal detail of `register!()` and not supposed to be used by =
anyone
> else.
>
>>
>>> +    /// Read a value from the given offset in the I/O region.
>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>;
>>
>> I think generally `Deref` bound shouldn't be exposed to user. What smart
>> pointers are involved here, and can we implement forwarding impls of `Io=
`?
>
> Removing the requirement for `Deref` in the `RegisterIo` trait is simple =
- we
> can just call `Deref` in the register IO accessors.

The issue with `Deref` bound here is that now you *require* a level of
indirection. If something implements `Io` directly, you cannot use it with =
the
method. While `&Bar` is accepted, `&Mmio` is not because `Mmio` is a direct
implementor of `Io` and not deref to it.

A `Deref` bound also does not help if, say, a type is `Arc<Bar>` which need=
s two
level of dereffing before it is Io. For consistency I think it's best to av=
oid
`Deref` call all together

>
> But I suspect you mean that we should also remove it from the register
> accessors themselves? The problem if I remove it there is that things lik=
e
> Nova's `Bar0` do not implement `IoKnownSize` and `IoCapable` (but rather =
deref
> to something that does), which would require all callers to do the deref =
op
> itself as deref coercion doesn't seem to be usable here.
>
>>
>>> +
>>> +    /// Write a value to the given offset in the I/O region.
>>> +    fn write<T, I>(self, io: &T, offset: usize)
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>;
>>> +}
>>> +
>>> +impl RegisterIo for u8 {
>>> +    #[inline(always)]
>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.read8(offset)
>>> +    }
>>> +
>>> +    #[inline(always)]
>>> +    fn write<T, I>(self, io: &T, offset: usize)
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.write8(self, offset)
>>> +    }
>>> +}
>>> +
>>> +impl RegisterIo for u16 {
>>> +    #[inline(always)]
>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.read16(offset)
>>> +    }
>>> +
>>> +    #[inline(always)]
>>> +    fn write<T, I>(self, io: &T, offset: usize)
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.write16(self, offset)
>>> +    }
>>> +}
>>> +
>>> +impl RegisterIo for u32 {
>>> +    #[inline(always)]
>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.read32(offset)
>>> +    }
>>> +
>>> +    #[inline(always)]
>>> +    fn write<T, I>(self, io: &T, offset: usize)
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.write32(self, offset)
>>> +    }
>>> +}
>>> +
>>> +#[cfg(CONFIG_64BIT)]
>>
>> This cfg should be removed.
>
> Done.
>
>>
>>> +impl RegisterIo for u64 {
>>> +    #[inline(always)]
>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.read64(offset)
>>> +    }
>>> +
>>> +    #[inline(always)]
>>> +    fn write<T, I>(self, io: &T, offset: usize)
>>> +    where
>>> +        T: Deref<Target =3D I>,
>>> +        I: IoKnownSize + IoCapable<Self>,
>>> +    {
>>> +        io.write64(self, offset)
>>> +    }
>>> +}
>>> +
>>> +/// Defines a dedicated type for a register, including getter and sett=
er methods for its fields and
>>> +/// methods to read and write it from an [`Io`] region.
>>> +///
>>> +/// Example:
>>> +///
>>> +/// ```
>>> +/// use kernel::register;
>>> +///
>>> +/// register! {
>>> +///     /// Basic information about the chip.
>>> +///     pub BOOT_0(u32) @ 0x00000100 {
>>> +///         /// Vendor ID.
>>> +///         15:8 vendor_id;
>>> +///         /// Major revision of the chip.
>>> +///         7:4 major_revision;
>>> +///         /// Minor revision of the chip.
>>> +///         3:0 minor_revision;
>>> +///     }
>>> +/// }
>>> +/// ```
>>> +///
>>> +/// This defines a `BOOT_0` type which can be read from or written to =
offset `0x100` of an `Io`
>>> +/// region. For instance, `minor_revision` consists of the 4 least sig=
nificant bits of the
>>> +/// register.
>>> +///
>>> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can =
be read by calling their
>>> +/// getter method, which is named after them. They also have setter me=
thods prefixed with `set_`
>>> +/// for runtime values and `with_` for constant values. All setters re=
turn the updated register
>>> +/// value.
>>> +///
>>> +/// ```no_run
>>> +/// use kernel::register;
>>> +/// use kernel::num::Bounded;
>>> +///
>>> +/// # register! {
>>> +/// #     pub BOOT_0(u32) @ 0x00000100 {
>>> +/// #         15:8 vendor_id;
>>> +/// #         7:4 major_revision;
>>> +/// #         3:0 minor_revision;
>>> +/// #     }
>>> +/// # }
>>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>=
(bar: &T) {
>>> +/// # fn obtain_vendor_id() -> u8 { 0xff }
>>> +/// // Read from the register's defined offset (0x100).
>>> +/// let boot0 =3D BOOT_0::read(&bar);
>>> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boo=
t0.minor_revision().get());
>>> +///
>>> +/// // Update some fields and write the new value back.
>>> +/// boot0
>>> +///     // Constant values.
>>> +///     .with_major_revision::<3>()
>>> +///     .with_minor_revision::<10>()
>>> +///     // Run-time value.
>>> +///     .set_vendor_id(obtain_vendor_id())
>>> +///     .write(&bar);
>>> +///
>>> +/// // Or, just read and update the register in a single step.
>>> +/// BOOT_0::update(&bar, |r| r
>>> +///     .with_major_revision::<3>()
>>> +///     .with_minor_revision::<10>()
>>> +///     .set_vendor_id(obtain_vendor_id())
>>> +/// );
>>> +///
>>> +/// // Constant values can also be built using the const setters.
>>> +/// const V: BOOT_0 =3D BOOT_0::zeroed()
>>> +///     .with_major_revision::<3>()
>>> +///     .with_minor_revision::<10>();
>>> +/// # }
>>> +/// ```
>>> +///
>>> +/// Fields can also be transparently converted from/to an arbitrary ty=
pe by using the bitfield `=3D>`
>>> +/// and `?=3D>` syntaxes.
>>> +///
>>> +/// If present, doccomments above register or fields definitions are a=
dded to the relevant item
>>> +/// they document (the register type itself, or the field's setter and=
 getter methods).
>>> +///
>>> +/// Note that multiple registers can be defined in a single `register!=
` invocation. This can be
>>> +/// useful to group related registers together.
>>> +///
>>> +/// ```
>>> +/// use kernel::register;
>>> +///
>>> +/// register! {
>>> +///     pub BOOT_0(u8) @ 0x00000100 {
>>> +///         7:4 major_revision;
>>> +///         3:0 minor_revision;
>>> +///     }
>>> +///
>>> +///     pub BOOT_1(u8) @ 0x00000101 {
>>> +///         7:5 num_threads;
>>> +///         4:0 num_cores;
>>> +///     }
>>> +/// };
>>> +/// ```
>>> +///
>>> +/// It is possible to create an alias of an existing register with new=
 field definitions by using
>>> +/// the `=3D> ALIAS` syntax. This is useful for cases where a register=
's interpretation depends on
>>> +/// the context:
>>> +///
>>> +/// ```
>>> +/// use kernel::register;
>>> +///
>>> +/// register! {
>>> +///     /// Scratch register.
>>> +///     pub SCRATCH(u32) @ 0x00000200 {
>>> +///         /// Raw value.
>>> +///         31:0 value;
>>> +///     }
>>> +///
>>> +///     /// Boot status of the firmware.
>>> +///     pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH {
>>> +///         /// Whether the firmware has completed booting.
>>> +///         0:0 completed;
>>> +///     }
>>> +/// }
>>> +/// ```
>>> +///
>>> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address a=
s `SCRATCH`, while also
>>> +/// providing its own `completed` field.
>>> +///
>>> +/// ## Relative registers
>>> +///
>>> +/// A register can be defined as being accessible from a fixed offset =
of a provided base. For
>>> +/// instance, imagine the following I/O space:
>>> +///
>>> +/// ```text
>>> +///           +-----------------------------+
>>> +///           |             ...             |
>>> +///           |                             |
>>> +///  0x100--->+------------CPU0-------------+
>>> +///           |                             |
>>> +///  0x110--->+-----------------------------+
>>> +///           |           CPU_CTL           |
>>> +///           +-----------------------------+
>>> +///           |             ...             |
>>> +///           |                             |
>>> +///           |                             |
>>> +///  0x200--->+------------CPU1-------------+
>>> +///           |                             |
>>> +///  0x210--->+-----------------------------+
>>> +///           |           CPU_CTL           |
>>> +///           +-----------------------------+
>>> +///           |             ...             |
>>> +///           +-----------------------------+
>>> +/// ```
>>> +///
>>> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at of=
fset `0x10` of their I/O
>>> +/// space segment. Since both instances of `CPU_CTL` share the same la=
yout, we don't want to define
>>> +/// them twice and would prefer a way to select which one to use from =
a single definition
>>> +///
>>> +/// This can be done using the `Base + Offset` syntax when specifying =
the register's address.
>>> +///
>>> +/// `Base` is an arbitrary type (typically a ZST) to be used as a gene=
ric parameter of the
>>> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. eac=
h type providing a base for
>>> +/// this register needs to implement `RegisterBase<Base>`. Here is the=
 above example translated
>>> +/// into code:
>>> +///
>>> +/// ```no_run
>>> +/// use kernel::register;
>>> +/// use kernel::io::register::RegisterBase;
>>> +///
>>> +/// // Type used to identify the base.
>>> +/// pub struct CpuCtlBase;
>>> +///
>>> +/// // ZST describing `CPU0`.
>>> +/// struct Cpu0;
>>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>>> +///     const BASE: usize =3D 0x100;
>>> +/// }
>>> +/// // Singleton of `CPU0` used to identify it.
>>> +/// const CPU0: Cpu0 =3D Cpu0;
>>> +///
>>> +/// // ZST describing `CPU1`.
>>> +/// struct Cpu1;
>>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>>> +///     const BASE: usize =3D 0x200;
>>> +/// }
>>> +/// // Singleton of `CPU1` used to identify it.
>>> +/// const CPU1: Cpu1 =3D Cpu1;
>>> +///
>>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>=
(bar: &T) {
>>> +/// // This makes `CPU_CTL` accessible from all implementors of `Regis=
terBase<CpuCtlBase>`.
>>> +/// register! {
>>> +///     /// CPU core control.
>>> +///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
>>> +///         /// Start the CPU core.
>>> +///         0:0 start;
>>> +///     }
>>> +/// }
>>> +///
>>> +/// // The `read`, `write` and `update` methods of relative registers =
take an extra `base` argument
>>> +/// // that is used to resolve its final address by adding its `BASE` =
to the offset of the
>>> +/// // register.
>>> +///
>>> +/// // Start `CPU0`.
>>> +/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
>>> +///
>>> +/// // Start `CPU1`.
>>> +/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
>>> +///
>>> +/// // Aliases can also be defined for relative register.
>>> +/// register! {
>>> +///     /// Alias to CPU core control.
>>> +///     pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase + CPU_CTL {
>>> +///         /// Start the aliased CPU core.
>>> +///         1:1 alias_start;
>>> +///     }
>>> +/// }
>>> +///
>>> +/// // Start the aliased `CPU0`.
>>> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
>>> +/// # }
>>> +/// ```
>>> +///
>>> +/// ## Arrays of registers
>>> +///
>>> +/// Some I/O areas contain consecutive registers that can be interpret=
ed in the same way. These
>>> +/// areas can be defined as an array of identical registers, allowing =
them to be accessed by index
>>> +/// with compile-time or runtime bound checking. Simply specify their =
size inside `[` and `]`
>>> +/// brackets, and add an `idx` parameter to their `read`, `write` and =
`update` methods:
>>> +///
>>> +/// ```no_run
>>> +/// use kernel::register;
>>> +///
>>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>=
(bar: &T)
>>> +/// #     -> Result<(), Error>{
>>> +/// # fn get_scratch_idx() -> usize {
>>> +/// #   0x15
>>> +/// # }
>>> +/// // Array of 64 consecutive registers with the same layout starting=
 at offset `0x80`.
>>> +/// register! {
>>> +///     /// Scratch registers.
>>> +///     pub SCRATCH(u32)[64] @ 0x00000080 {
>>> +///         31:0 value;
>>> +///     }
>>> +/// }
>>> +///
>>> +/// // Read scratch register 0, i.e. I/O address `0x80`.
>>> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
>>> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
>>> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
>>> +///
>>> +/// // This is out of bounds and won't build.
>>> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
>>> +///
>>> +/// // Runtime-obtained array index.
>>> +/// let scratch_idx =3D get_scratch_idx();
>>> +/// // Access on a runtime index returns an error if it is out-of-boun=
ds.
>>> +/// let some_scratch =3D SCRATCH::try_read(&bar, scratch_idx)?.value()=
;
>>> +///
>>> +/// // Alias to a particular register in an array.
>>> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
>>> +/// register! {
>>> +///     /// Firmware exit status code.
>>> +///     pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8] {
>>> +///         7:0 status;
>>> +///     }
>>> +/// }
>>> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
>>> +///
>>> +/// // Non-contiguous register arrays can be defined by adding a strid=
e parameter.
>>> +/// // Here, each of the 16 registers of the array are separated by 8 =
bytes, meaning that the
>>> +/// // registers of the two declarations below are interleaved.
>>> +/// register! {
>>> +///     /// Scratch registers bank 0.
>>> +///     pub SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ 0x000000c0 {
>>> +///         31:0 value;
>>> +///     }
>>> +///
>>> +///     /// Scratch registers bank 1.
>>> +///     pub SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ 0x000000c4 {
>>> +///         31:0 value;
>>> +///     }
>>> +/// }
>>> +/// # Ok(())
>>> +/// # }
>>> +/// ```
>>> +///
>>> +/// ## Relative arrays of registers
>>> +///
>>> +/// Combining the two features described in the sections above, arrays=
 of registers accessible from
>>> +/// a base can also be defined:
>>> +///
>>> +/// ```no_run
>>> +/// use kernel::register;
>>> +/// use kernel::io::register::RegisterBase;
>>> +///
>>> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>=
(bar: &T)
>>> +/// #     -> Result<(), Error>{
>>> +/// # fn get_scratch_idx() -> usize {
>>> +/// #   0x15
>>> +/// # }
>>> +/// // Type used as parameter of `RegisterBase` to specify the base.
>>> +/// pub struct CpuCtlBase;
>>> +///
>>> +/// // ZST describing `CPU0`.
>>> +/// struct Cpu0;
>>> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
>>> +///     const BASE: usize =3D 0x100;
>>> +/// }
>>> +/// // Singleton of `CPU0` used to identify it.
>>> +/// const CPU0: Cpu0 =3D Cpu0;
>>> +///
>>> +/// // ZST describing `CPU1`.
>>> +/// struct Cpu1;
>>> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
>>> +///     const BASE: usize =3D 0x200;
>>> +/// }
>>> +/// // Singleton of `CPU1` used to identify it.
>>> +/// const CPU1: Cpu1 =3D Cpu1;
>>> +///
>>> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
>>> +/// register! {
>>> +///     /// Per-CPU scratch registers.
>>> +///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
>>> +///         31:0 value;
>>> +///     }
>>> +/// }
>>> +///
>>> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
>>> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, 15).value()=
;
>>> +///
>>> +/// // This won't build.
>>> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, 128).va=
lue();
>>> +///
>>> +/// // Runtime-obtained array index.
>>> +/// let scratch_idx =3D get_scratch_idx();
>>> +/// // Access on a runtime value returns an error if it is out-of-boun=
ds.
>>> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, scrat=
ch_idx)?.value();
>>> +///
>>> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
>>> +/// register! {
>>> +///     /// Per-CPU firmware exit status code.
>>> +///     pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase + CPU_SCRATCH[8] =
{
>>> +///         7:0 status;
>>> +///     }
>>> +/// }
>>> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status(=
);
>>> +///
>>> +/// // Non-contiguous register arrays can be defined by adding a strid=
e parameter.
>>> +/// // Here, each of the 16 registers of the array are separated by 8 =
bytes, meaning that the
>>> +/// // registers of the two declarations below are interleaved.
>>> +/// register! {
>>> +///     /// Scratch registers bank 0.
>>> +///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ CpuCtlBase + 0x00=
000d00 {
>>
>> I discussed this with Alex off-list and we agree that this'll better be
>>
>>     pub CPU_SCRATCH_INTERLEAVED_0(u32)[u16, stride =3D 8] @ CpuCtlBase +=
 0x00000d00
>>
>> spelling the full intention out rather than have a special syntax, as th=
is isn't
>> the common case.
>
> Implemented it and it indeed looks much better.
>
>>
>>> +///         31:0 value;
>>> +///     }
>>> +///
>>> +///     /// Scratch registers bank 1.
>>> +///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ CpuCtlBase + 0x00=
000d04 {
>>> +///         31:0 value;
>>> +///     }
>>> +/// }
>>> +/// # Ok(())
>>> +/// # }
>>> +/// ```
>>> +/// [`Io`]: kernel::io::Io
>>> +#[macro_export]
>>> +macro_rules! register {
>>> +    // Entry point for the macro, allowing multiple registers to be de=
fined in one call.
>>> +    // It matches all possible register declaration patterns to dispat=
ch them to corresponding
>>> +    // `@reg` rule that defines a single register.
>>> +    (
>>> +        $(
>>> +            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>>> +                $([ $size:expr $(; $stride:expr)? ])? $(@ $offset:lite=
ral)?
>>> +                $(@ $base:ident + $base_offset:literal)?
>>
>> Does `$(@ $($base:ident +)? $offset:literal)?` not work?
>
> It does! I was trying to match the `+` in the right-side expression and
> obviously couldn't, but it didn't occur to me to do it the other way. :)
>
>>
>>> +                $(=3D> $alias:ident $(+ $alias_offset:ident)? $([$alia=
s_idx:expr])? )?
>>> +            { $($fields:tt)* }
>>> +        )*
>>> +    ) =3D> {
>>> +        $(
>>> +        ::kernel::register!(
>>
>> $crate::register!()
>
> Updated throughout the file (I am not sure to understand the difference t=
hough?).

It'll always resolve to the correct crate.

In theory, a crate can do

    extern crate kernel as shell;
    extern crate foobar as kernel;

and now ::kernel:: would resolve to the wrong crate. Of course, people doin=
g
this are just shooting their own foot so it's not something to worry about.

Using `$crate::` also allow re-exporting of the macro without adding a dire=
ct
dependency (as indirect dependencies are not visible with ::crate_name).

Neither are issue of the `kernel` crate, but in general it's advisable to u=
se
`$crate` where possible.

>
>>
>>> +            @reg $(#[$attr])* $vis $name ($storage) $([$size $(; $stri=
de)?])?
>>> +                $(@ $offset)?
>>> +                $(@ $base + $base_offset)?
>>> +                $(=3D> $alias $(+ $alias_offset)? $([$alias_idx])? )?
>>> +            { $($fields)* }
>>> +        );
>>> +        )*
>>> +    };
>>> +
>>> +    // All the rules below are private helpers.
>>> +
>>> +    // Creates a register at a fixed offset of the MMIO space.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $o=
ffset:literal
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_fixed $name($storage) @ $offset);
>>> +    };
>>> +
>>> +    // Creates an alias register of fixed offset register `alias` with=
 its own fields.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D>=
 $alias:ident
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET=
);
>>> +    };
>>> +
>>> +    // Creates a register at a relative offset from a base address pro=
vider.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $b=
ase:ident + $offset:literal
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_relative $name($storage) @ $base + $of=
fset );
>>> +    };
>>> +
>>> +    // Creates an alias register of relative offset register `alias` w=
ith its own fields.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D>=
 $base:ident + $alias:ident
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_relative $name($storage) @ $base + $al=
ias::OFFSET );
>>
>> Would this generate error messages if $name and $alias are of different =
base, or
>> would such case be a bug but silently compiles?
>
> You would get an build error when trying to use the alias as the bases
> are dedicated types and the types would be incompatible.
>
>>
>>> +    };
>>> +
>>> +    // Creates an array of registers at a fixed offset of the MMIO spa=
ce.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>>> +            [ $size:expr ; $stride:expr ] @ $offset:literal { $($field=
s:tt)* }
>>> +    ) =3D> {
>>> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride=
);
>>> +
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_array $name($storage) [ $size ; $strid=
e ] @ $offset);
>>> +    };
>>> +
>>> +    // Shortcut for contiguous array of registers (stride =3D=3D size =
of element).
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $s=
ize:expr ] @ $offset:literal
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::s=
ize_of::<$storage>() ]
>>> +                @ $offset { $($fields)* }
>>> +        );
>>> +    };
>>> +
>>> +    // Creates an alias of register `idx` of array of registers `alias=
` with its own fields.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D>=
 $alias:ident [ $idx:expr ]
>>> +            { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        static_assert!($idx < $alias::SIZE);
>>> +
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET=
 + $idx * $alias::STRIDE);
>>> +    };
>>> +
>>> +    // Creates an array of registers at a relative offset from a base =
address provider.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $s=
ize:expr ; $stride:expr ]
>>> +            @ $base:ident + $offset:literal { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride=
);
>>> +
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(
>>> +            @io_relative_array $name($storage) [ $size ; $stride ] @ $=
base + $offset
>>> +        );
>>> +    };
>>> +
>>> +    // Shortcut for contiguous array of relative registers (stride =3D=
=3D size of element).
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $s=
ize:expr ]
>>> +            @ $base:ident + $offset:literal { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(
>>> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::s=
ize_of::<$storage>() ]
>>> +                @ $base + $offset { $($fields)* }
>>> +        );
>>> +    };
>>> +
>>> +    // Creates an alias of register `idx` of relative array of registe=
rs `alias` with its own
>>> +    // fields.
>>> +    (
>>> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
>>> +            =3D> $base:ident + $alias:ident [ $idx:expr ] { $($fields:=
tt)* }
>>> +    ) =3D> {
>>> +        static_assert!($idx < $alias::SIZE);
>>> +
>>> +        ::kernel::register!(
>>> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fi=
elds)* }
>>> +        );
>>> +        ::kernel::register!(
>>> +            @io_relative $name($storage) @ $base + $alias::OFFSET + $i=
dx * $alias::STRIDE
>>> +        );
>>> +    };
>>> +
>>> +    // Generates the bitfield for the register.
>>> +    //
>>> +    // `#[allow(non_camel_case_types)]` is added since register names =
typically use SCREAMING_CASE.
>>> +    (
>>> +        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($stora=
ge:ty) { $($fields:tt)* }
>>> +    ) =3D> {
>>> +        ::kernel::register!(@bitfield_core
>>> +            #[allow(non_camel_case_types)]
>>> +            $(#[$attr])* $vis $name $storage
>>> +        );
>>> +        ::kernel::register!(@bitfield_fields $vis $name $storage { $($=
fields)* });
>>> +    };
>>> +
>>> +    // Generates the IO accessors for a fixed offset register.
>>> +    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) =3D> {
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +            /// Absolute offset of the register.
>>> +            pub const OFFSET: usize =3D $offset;
>>> +
>>> +            /// Read the register from its address in `io`.
>>> +            #[inline(always)]
>>> +            pub fn read<T, I>(io: &T) -> Self where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                Self(<$storage as $crate::io::register::RegisterIo>::r=
ead(io, Self::OFFSET))
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to the register ad=
dress in `io`.
>>> +            #[inline(always)]
>>> +            pub fn write<T, I>(self, io: &T) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                <$storage as $crate::io::register::RegisterIo>::write(=
self.0, io, Self::OFFSET)
>>> +            }
>>> +
>>> +            /// Read the register from its address in `io` and run `f`=
 on its value to obtain a new
>>> +            /// value to write back.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>
>> Given the non-atomicity, how much value does it provide compared to havi=
ng the
>> user write read and write themselves? I feel that people reading the cod=
e may
>> assume the atomicity without reading docs if they see `FOO::update`, whi=
le it's
>> less likely that they do so if they read
>> `FOO::read(io).with_bar(baz).write(io)`.
>
> It is just a convenience method. I cannot pretend it is widely used, but
> it allows to turn multiple-step ops into one-liners.
>
>>
>>> +            #[inline(always)]
>>> +            pub fn update<T, I, F>(
>>> +                io: &T,
>>> +                f: F,
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                let reg =3D f(Self::read(io));
>>> +                reg.write(io);
>>> +            }
>>> +        }
>>> +    };
>>> +
>>> +    // Generates the IO accessors for a relative offset register.
>>> +    (@io_relative $name:ident ($storage:ty) @ $base:ident + $offset:ex=
pr ) =3D> {
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +            /// Relative offset of the register.
>>> +            pub const OFFSET: usize =3D $offset;
>>> +
>>> +            /// Read the register from `io`, using the base address pr=
ovided by `base` and adding
>>> +            /// the register's offset to it.
>>> +            #[inline(always)]
>>> +            pub fn read<T, I, B>(
>>> +                io: &T,
>>> +                #[allow(unused_variables)]
>>> +                base: &B,
>>> +            ) -> Self where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                let offset =3D <B as $crate::io::register::RegisterBas=
e<$base>>::BASE + Self::OFFSET;
>>> +
>>> +                Self(<$storage as $crate::io::register::RegisterIo>::r=
ead(io, offset))
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to `io`, using the=
 base address provided by
>>> +            /// `base` and adding the register's offset to it.
>>> +            #[inline(always)]
>>> +            pub fn write<T, I, B>(
>>> +                self,
>>> +                io: &T,
>>> +                #[allow(unused_variables)]
>>> +                base: &B,
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                let offset =3D <B as $crate::io::register::RegisterBas=
e<$base>>::BASE + Self::OFFSET;
>>> +
>>> +                <$storage as $crate::io::register::RegisterIo>::write(=
self.0, io, offset)
>>> +            }
>>> +
>>> +            /// Read the register from `io`, using the base address pr=
ovided by `base` and adding
>>> +            /// the register's offset to it, then run `f` on its value=
 to obtain a new value to
>>> +            /// write back.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>> +            #[inline(always)]
>>> +            pub fn update<T, I, B, F>(
>>> +                io: &T,
>>> +                base: &B,
>>> +                f: F,
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                let reg =3D f(Self::read(io, base));
>>> +                reg.write(io, base);
>>> +            }
>>> +        }
>>> +    };
>>> +
>>> +    // Generates the IO accessors for an array of registers.
>>> +    (@io_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ]=
 @ $offset:literal) =3D> {
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +            /// Absolute offset of the register array.
>>> +            pub const OFFSET: usize =3D $offset;
>>> +            /// Number of elements in the array of registers.
>>> +            pub const SIZE: usize =3D $size;
>>> +            /// Number of bytes separating each element of the array o=
f registers.
>>> +            pub const STRIDE: usize =3D $stride;
>>> +
>>> +            /// Read the array register at index `idx` from its addres=
s in `io`.
>>> +            #[inline(always)]
>>> +            pub fn read<T, I>(
>>> +                io: &T,
>>> +                idx: usize,
>>> +            ) -> Self where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                build_assert!(idx < Self::SIZE);
>>> +
>>> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
>>> +
>>> +                Self(<$storage as $crate::io::register::RegisterIo>::r=
ead(io, offset))
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to the array regis=
ter with index `idx` in `io`.
>>> +            #[inline(always)]
>>> +            pub fn write<T, I>(
>>> +                self,
>>> +                io: &T,
>>> +                idx: usize
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                build_assert!(idx < Self::SIZE);
>>> +
>>> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
>>> +
>>> +                <$storage as $crate::io::register::RegisterIo>::write(=
self.0, io, offset)
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` in `io` and run=
 `f` on its value to obtain a
>>> +            /// new value to write back.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>> +            #[inline(always)]
>>> +            pub fn update<T, I, F>(
>>> +                io: &T,
>>> +                idx: usize,
>>> +                f: F,
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                let reg =3D f(Self::read(io, idx));
>>> +                reg.write(io, idx);
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` from its addres=
s in `io`.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            #[inline(always)]
>>> +            pub fn try_read<T, I>(
>>> +                io: &T,
>>> +                idx: usize,
>>> +            ) -> ::kernel::error::Result<Self> where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(Self::read(io, idx))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to the array regis=
ter with index `idx` in `io`.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            #[inline(always)]
>>> +            pub fn try_write<T, I>(
>>> +                self,
>>> +                io: &T,
>>> +                idx: usize,
>>> +            ) -> ::kernel::error::Result where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(self.write(io, idx))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` in `io` and run=
 `f` on its value to obtain a
>>> +            /// new value to write back.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>> +            #[inline(always)]
>>> +            pub fn try_update<T, I, F>(
>>> +                io: &T,
>>> +                idx: usize,
>>> +                f: F,
>>> +            ) -> ::kernel::error::Result where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(Self::update(io, idx, f))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +        }
>>> +    };
>>> +
>>> +    // Generates the IO accessors for an array of relative registers.
>>> +    (
>>> +        @io_relative_array $name:ident ($storage:ty) [ $size:expr ; $s=
tride:expr ]
>>> +            @ $base:ident + $offset:literal
>>> +    ) =3D> {
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +            /// Relative offset of the register array.
>>> +            pub const OFFSET: usize =3D $offset;
>>> +            /// Number of elements in the array of registers.
>>> +            pub const SIZE: usize =3D $size;
>>> +            /// Number of bytes separating each element of the array o=
f registers.
>>> +            pub const STRIDE: usize =3D $stride;
>>> +
>>> +            /// Read the array register at index `idx` from `io`, usin=
g the base address provided
>>> +            /// by `base` and adding the register's offset to it.
>>> +            #[inline(always)]
>>> +            pub fn read<T, I, B>(
>>> +                io: &T,
>>> +                #[allow(unused_variables)]
>>> +                base: &B,
>>> +                idx: usize,
>>> +            ) -> Self where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                build_assert!(idx < Self::SIZE);
>>> +
>>> +                let offset =3D <B as $crate::io::register::RegisterBas=
e<$base>>::BASE +
>>> +                    Self::OFFSET + (idx * Self::STRIDE);
>>> +
>>> +                Self(<$storage as $crate::io::register::RegisterIo>::r=
ead(io, offset))
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to `io`, using the=
 base address provided by
>>> +            /// `base` and adding the offset of array register `idx` t=
o it.
>>> +            #[inline(always)]
>>> +            pub fn write<T, I, B>(
>>> +                self,
>>> +                io: &T,
>>> +                #[allow(unused_variables)]
>>> +                base: &B,
>>> +                idx: usize
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                build_assert!(idx < Self::SIZE);
>>> +
>>> +                let offset =3D <B as $crate::io::register::RegisterBas=
e<$base>>::BASE +
>>> +                    Self::OFFSET + (idx * Self::STRIDE);
>>> +
>>> +                <$storage as $crate::io::register::RegisterIo>::write(=
self.0, io, offset)
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` from `io`, usin=
g the base address provided
>>> +            /// by `base` and adding the register's offset to it, then=
 run `f` on its value to
>>> +            /// obtain a new value to write back.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>> +            #[inline(always)]
>>> +            pub fn update<T, I, B, F>(
>>> +                io: &T,
>>> +                base: &B,
>>> +                idx: usize,
>>> +                f: F,
>>> +            ) where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                let reg =3D f(Self::read(io, base, idx));
>>> +                reg.write(io, base, idx);
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` from `io`, usin=
g the base address provided
>>> +            /// by `base` and adding the register's offset to it.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            #[inline(always)]
>>> +            pub fn try_read<T, I, B>(
>>> +                io: &T,
>>> +                base: &B,
>>> +                idx: usize,
>>> +            ) -> ::kernel::error::Result<Self> where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(Self::read(io, base, idx))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +
>>> +            /// Write the value contained in `self` to `io`, using the=
 base address provided by
>>> +            /// `base` and adding the offset of array register `idx` t=
o it.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            #[inline(always)]
>>> +            pub fn try_write<T, I, B>(
>>> +                self,
>>> +                io: &T,
>>> +                base: &B,
>>> +                idx: usize,
>>> +            ) -> ::kernel::error::Result where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(self.write(io, base, idx))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +
>>> +            /// Read the array register at index `idx` from `io`, usin=
g the base address provided
>>> +            /// by `base` and adding the register's offset to it, then=
 run `f` on its value to
>>> +            /// obtain a new value to write back.
>>> +            ///
>>> +            /// The validity of `idx` is checked at run-time, and `EIN=
VAL` is returned if the
>>> +            /// access was out-of-bounds.
>>> +            ///
>>> +            /// Note that this operation is not atomic. In concurrent =
contexts, external
>>> +            /// synchronization may be required to prevent race condit=
ions.
>>> +            #[inline(always)]
>>> +            pub fn try_update<T, I, B, F>(
>>> +                io: &T,
>>> +                base: &B,
>>> +                idx: usize,
>>> +                f: F,
>>> +            ) -> ::kernel::error::Result where
>>> +                T: ::core::ops::Deref<Target =3D I>,
>>> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable=
<$storage>,
>>> +                B: $crate::io::register::RegisterBase<$base>,
>>> +                F: ::core::ops::FnOnce(Self) -> Self,
>>> +            {
>>> +                if idx < Self::SIZE {
>>> +                    Ok(Self::update(io, base, idx, f))
>>> +                } else {
>>> +                    Err(::kernel::error::code::EINVAL)
>>> +                }
>>> +            }
>>> +        }
>>> +    };
>>> +
>>> +    // Defines the wrapper `$name` type and its conversions from/to th=
e storage type.
>>> +    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty=
) =3D> {
>>> +        $(#[$attr])*
>>> +        #[repr(transparent)]
>>> +        #[derive(Clone, Copy, PartialEq, Eq)]
>>
>> You can derive `Zeroable` and save you an unsafe impl.
>
> Unfortunately this happens if I try to do it:
>
>     error: no rules expected `(`
> 		    --> ../samples/rust/rust_driver_pci.rs:74:9
> 		    |
> 	    74 | /         ::kernel::register! {
> 	    75 | |             VENDOR_ID(u16) @ 0x0 {
> 	    76 | |                 15:0 vendor_id;
>     ...    |
> 	    86 | |         }
> 		    | |_________^ no rules expected this token in macro call
>
> Not quite sure why to be honest.

I'll look into this.

>
>>
>>> +        $vis struct $name($storage);
>>> +
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +            /// Creates a bitfield from a raw value.
>>> +            $vis const fn from_raw(value: $storage) -> Self {
>>> +                Self(value)
>>> +            }
>>> +
>>> +            /// Creates a zeroed bitfield value.
>>> +            ///
>>> +            /// This is a const alternative to the `Zeroable::zeroed()=
` trait method.
>>> +            $vis const fn zeroed() -> Self {
>>> +                Self(0)
>>> +            }
>>
>> All types that impl `Zeroable` automatically have the `::zeroed()` fn pr=
ovided
>> via the trait.
>
> Yes, but that method from the trait cannot be used in const context, and
> `zeroed` is the starting point for building register values from scratch =
(and
> thus constant values).

`pin_init:::zeroed()` is a const function.

Best,
Gary

>
>>
>>> +
>>> +            /// Returns the raw value of this bitfield.
>>> +            ///
>>> +            /// This is similar to the [`From`] implementation, but is=
 shorter to invoke in
>>> +            /// most cases.
>>> +            $vis const fn as_raw(self) -> $storage {
>>> +                self.0
>>> +            }
>>> +        }
>>> +
>>> +        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent=
.
>>> +        unsafe impl ::pin_init::Zeroable for $name {}
>>> +
>>> +        impl ::core::convert::From<$name> for $storage {
>>> +            fn from(val: $name) -> $storage {
>>> +                val.as_raw()
>>> +            }
>>> +        }
>>> +
>>> +        impl ::core::convert::From<$storage> for $name {
>>> +            fn from(val: $storage) -> $name {
>>> +                Self::from_raw(val)
>>> +            }
>>> +        }
>>> +    };
>>> +
>>> +    // Definitions requiring knowledge of individual fields: private a=
nd public field accessors,
>>> +    // and `Debug` implementation.
>>> +    (@bitfield_fields $vis:vis $name:ident $storage:ty {
>>> +        $($(#[doc =3D $doc:expr])* $hi:literal:$lo:literal $field:iden=
t
>>> +            $(?=3D> $try_into_type:ty)?
>>> +            $(=3D> $into_type:ty)?
>>> +        ;
>>> +        )*
>>> +    }
>>> +    ) =3D> {
>>> +        #[allow(dead_code)]
>>> +        impl $name {
>>> +        $(
>>> +        ::kernel::register!(@private_field_accessors $vis $name $stora=
ge : $hi:$lo $field);
>>> +        ::kernel::register!(
>>> +            @public_field_accessors $(#[doc =3D $doc])* $vis $name $st=
orage : $hi:$lo $field
>>> +            $(?=3D> $try_into_type)?
>>> +            $(=3D> $into_type)?
>>> +        );
>>> +        )*
>>> +        }
>>> +
>>> +        ::kernel::register!(@debug $name { $($field;)* });
>>> +    };
>>> +
>>> +    // Private field accessors working with the correct `Bounded` type=
 for the field.
>>> +    (
>>> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $h=
i:tt:$lo:tt $field:ident
>>> +    ) =3D> {
>>> +        ::kernel::macros::paste!(
>>> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusiv=
e<u8> =3D $lo..=3D$hi;
>>
>> Is this used by anything?
>
> Not yet. This is intended for user code that wants to know which bits are=
 used
> by a specific field. I don't mind removing it though.
>
> Thanks for the review and ideas!

