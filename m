Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020080.outbound.protection.outlook.com [52.101.196.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74344CAC2;
	Tue, 28 Apr 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381877; cv=fail; b=Usn6YSTro+v2VmFCgKin7iDHaAxnlZscNkwsBfKcIUboWJoov2JnlmteeF2xkMYBkmRnv2ay89ezZUUE/EZOnbJFuNGZvDveo7sZVMbg5ZNQZtxeElf5f99mYCWv7QVygi6ppn5mu6jVnlnxXI9+33P5yTvpk3gbo0YO7ba8bKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381877; c=relaxed/simple;
	bh=F4IR1UR22+Gieu1k5NJUVZS8JnpaPD8ina1kQsXcTxQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=XNMR85HK7Hp/U3OyRbbS6fdLGoYtWMaOPCzP8cJ2s0DCpokGsQpxj4nkQlQwOsHJ/bRChxZO4WwZtPXFr02gD7rFVaqQK43U9gAzsi/6eO9gysWFwndwRMcLhivTRIRKTDHIzZWpa6BRieBj19qouyuuwwyDHsav8TOMGh/8YvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=syCrAcwU; arc=fail smtp.client-ip=52.101.196.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="syCrAcwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqn7zyWISNAguDKxtP3yZaYvS72DNy9oSguqvDK1DOQvFN2GX0bf+q32gi3k0azQXJcEFvm8yqa4bWH+NMy8rOUi2xmm7Oig5b0SoMA+gnVhsvgeqlhn64rmZUccdlAESzhgea62xnBi0LRm5OGtsg92nwCDaaV+aTZ3iIb+AH6d3BisewVQo3/RsQh9nO5i2vohEtGf2AuC/2zefBJs/xSujZIkloAPL8R1K4rI0+eF8wAfWw7D3jTmxlsWVi9Z/PBUFNZaQ5n8zARTBQPo41e7s9jWvMPdqG3wj9Tni6LLVhFXSO6mbDsIB3iBGrhc7x51m6fKjmUlxWZCcQvm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qta8hb0zmtjRV83zD2iJAN8rPeQWE9ehQNDDIwwq/Uw=;
 b=pvjfvgh60Ir9FJB2EDQjojPFFnxbXAEMFju5WTMY21Sgd1ckl8sEqrNeIUfKjrW4dOrSW3LnQ83c5cRnc2/Xc4qLzOjL/IKmfS1IBO5YKkKUeme8SmFk4lp8p8henPsqRI0v6VAsbGDCzU8cbrB484JQaUzKKLpTbucj55g0MygIfmjEwB7mq5dJS3VGyaTlM5C2sWgA6/ZAwCZNRucaE2Y4UC+99dxCCEYzvM4BekLtqNIltZcJ0bpc0IUSoej4KSiFEPWjlBXRR3WqOvA5uq/oPd8qnNvebtOyi0DaaogarZmrfNRYeaS9OBxIfHvLCuS7GLSkwagMflx1CO6/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qta8hb0zmtjRV83zD2iJAN8rPeQWE9ehQNDDIwwq/Uw=;
 b=syCrAcwU2IBx32vaNooHacPGXdbK4M6rYyDkOrLGTEQQNjIlXu2F4tfNKGJ1cGBDpSw4A2vrxlayW2wezbjkj9yZHNXm+Kr1momIrbon4F/RoK4jewtz+BRm14uaetD60Gnz0nh3jCaYPh7QOmDqP+Ue1YHTLnkZcifZ9jvuDPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5208.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:10 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 00/10] rust: pin-init upstream sync for v7.2 (round 1)
Date: Tue, 28 Apr 2026 14:10:49 +0100
Message-Id: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmx8GkC/yXMMQ6DMAxA0asgz7UUogBqr1J1CMEFdzAoBgRCu
 TuBjm/4/wClyKTwKg6ItLLyKBnlo4AweOkJucsGa2xtXOlwYkEWnlF3CejJmebpKt/YGnIzRfr
 ydv/en791aX8U5msCKZ0tA0fDcQAAAA==
X-Change-ID: 20260414-pin-init-sync-ae407945a726
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alistair Francis <alistair.francis@wdc.com>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=4176;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=F4IR1UR22+Gieu1k5NJUVZS8JnpaPD8ina1kQsXcTxQ=;
 b=6fFYqrAmzsMMsQkEjhZzgYqy9KFgPeTTHYk2ow4P7kLDpK5pt9hHx8n/YkTOHxts83hjWnfUE
 QkkFjK+i8cdAqRRDeMGYI8Pzw9q3V16fpC4oMwiNKrXIDE90uJII5Rf
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: f9026993-8040-47b8-06a2-08dea5279d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/fbt6Isl8hAW2+4mlBaxMy5N/7FNZCsuwC6R/t2btIpd4VImQ8QmD0Z4sOD2gN/C4hwUW14Ktp9cvtgJ8S9i7pZ/alezpLf8JS/CbrlFSkygKpGRx8Dnj8vjQjZzjviaYH3GGa4AUR1W36878LITpjzECFdfHaN9fowE1ishJ0a8Cs3viVtwchKcy0eO2BRAJL0+EqGxFh/2dTbhhbhKlDz0Q8ub72weDUCtg/ZuoeqVBsDHcZrCBR1SE+eY5L4orBgNzC8/fXT7ZtoyfgSc3HNJetvDTCz5TCo/bBSTit/sy32ub/xuVUo559ne18JVT6sYI+CMycRugiVHwSWuckeujZFiZRRp4jBk8q8hewyFU2S7s/WQxwQA2PpgfS3hnzaodNUzwHViNZN1U4FiO1YA9x8fcwSRIk+tdk/Fo5uJVVyxFTchOuEa3E4jl0mViFU5YkRer6+FYQu4ubbWVFidJ3lGjdJ1yz1AMJhIucgUjpY6a9kh8lNuskLPycF5OYw57od4ck2K0bpd5J47if2d9BzegF8ffqFqTxDTnu0c9C4o3FYYsn+wY2NjNwB2h4kVT8PDZDqP0Ewf+jbDEQ5BYim0/Yw9CNIEDTzVq13V0In1RlyAE+OK/cfbSVwhVxMK063WY1FD9l0BRskiig0+QtglgRpBr7BijNrUhOpK7mwFE/QX4xZgp9AGVXjV/o+SKRG7C+NgL1eE3+ZyvzK99kJJggXFQb2Q8z33/JY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWhJa0tPK0RrZExyTmNVQ3QrVmVRc3dhYXF1Q3Q5VFNZYVROcW1tTURPbWg4?=
 =?utf-8?B?RkE4WCs1MlhVellrbjFxOXBaYXdvbXo1ajZyTTZrdDJmQnZYY3Y3TEFTSG91?=
 =?utf-8?B?SzhsM0VZdjM1YmhjZHFRenU3cGMwUlRvcUI0ZmQ3QXU0Z2lBZit4MkU2eURp?=
 =?utf-8?B?T3dUTmEyTWZKeHc2WDRVSi9nbzZvZlZiTzk2NVRyc1ZsMkRLUkNMK2phWUVN?=
 =?utf-8?B?TUZBRi9STk1DSmV6M1JoNEJGdjYyWDEyVGFubHBlTG5HVW5LZUNjSXk2bnRh?=
 =?utf-8?B?eFRoS2VnSTM0K1FFczRTWmljemNYeXU4ODBackorUFpGUUErazVRbCtBZEt4?=
 =?utf-8?B?ZW1UYlFpUTFJZHlGb0pUYndEMmRXcWpPQzFjRXNkWDVxSkR3ZGhqYUFacWUr?=
 =?utf-8?B?MnEvOXpjbStXVHBHRGprL3MvaTg2bnlGZm9aSzlUMGJzM0c4Y2NaOEEwcUlY?=
 =?utf-8?B?T3RTQlkxTTlnMG9IM3NmRlZLMHlBZENTTTk5dGUxYmRGYyt0eUtjRnZTbEJs?=
 =?utf-8?B?SS9jNmcwV1NIS2RJUlh0VmRsZjZ6d2tyZEhKY2N0WnIzTlg2bUNrbjY5SThV?=
 =?utf-8?B?dlFFUnJRRWIwYU9ScURuS0Rjclp2WWRFV1J6Tk41SGNiUE1IT3h2dFFmYzNr?=
 =?utf-8?B?Qm5iTGdkalRQV2k2NmZxY0ppWkM4YVBjOHRsRGNWT2hMcmRiZDE1Q0c3OWVU?=
 =?utf-8?B?eENwK0VlR2pkLzZ6QlJ3S0tmRk5UV2Zpd1R6WlUxcHlpSU53VU1tSEhaWCtl?=
 =?utf-8?B?dFhMbHM2VXJCbG5DeU50N0xseWt4eDFxVnV3Y0hLL2pnNjdGVGQvdXF3d1RN?=
 =?utf-8?B?M0JiUGFJWUxOdnFCMWdlVmY4R21Wa09qMkJ0ZElPbWdNNjQ1ZldyL3ZTMWlj?=
 =?utf-8?B?eXNPWXlnZm52YTNDZnR6anJwOWpScmN3RVh5ckgvT2hHZzJZVFJxUVM3NHdL?=
 =?utf-8?B?Y1JNeXhaL3NEZHNYUGtRNW01TEsvTGxpV0Z3U1FwZjVKUHRuakltdHczanlC?=
 =?utf-8?B?ZWkyMUl1L3FJSXMzeEJZQVp5cEdQcjJCbTVkczkwVGZzU0FHaVdPaHRnZk9I?=
 =?utf-8?B?K0xSTFVETlhsb2VENStkSFVwSURXMjhUd0VvTEc3UWJ6ZzdZUUo1VDN5ZzlE?=
 =?utf-8?B?UFJUTWdBZTJIcnhCaHQ5YUUwZG16bzNxWHcvK0dxRGh5Z3hKYVdnZjlRdUhC?=
 =?utf-8?B?NnBBdGZITXYwWWh0RjVBR29Fa0JSQUs0alFMWU9WV0UyL3E0ei9iNnNneC9h?=
 =?utf-8?B?MWVEbDBLbDhxanNiUnN1MnpoZG9Db2JzSDF0UjNmZEorQi9mYUhIcDh0RzVp?=
 =?utf-8?B?TFpIUEgwdHdUOHBQY1pNb1ZqeVlGZmhOdlo0cHBDbms1RjdIbXFEbzJhNWhQ?=
 =?utf-8?B?VkFQMmliQVY0eS9kQ2FEMWs3UmdzVjJycHM5UFpxN1NrbnV4bU5wTHNHZ1pR?=
 =?utf-8?B?eXoreUxLY2lKYytFdG95WW5qYVJ0RGRlWVBwWEljMGZscm1DL1hVbDlFMHBB?=
 =?utf-8?B?QldIY3RKZmtuSlZYZU53V25MZTROOUxrMWVPOGFxcUh6ZXZNbU83dEYyN1h5?=
 =?utf-8?B?L210TzBsalF1T3pocEUrOENIN1ArbXZxSEpTNWFoQ0k3OVhYb0FNem5qUVdI?=
 =?utf-8?B?L1dNT2ppS0dEV3hpdm13bVc5cmR5Ymc2MmRrZ3FvWitmSHp3OURocmJvYlRl?=
 =?utf-8?B?Q3hINzVMSXJKdzJlT0JQZzF4Z3FXcnZ5RjNQVVNrMVNaRDlDZys3UlFQUkRU?=
 =?utf-8?B?aVhpZElac3J0a1ZCV2pBcmpJMW1RWFRJV3U4SHRzL0o0ai90VnZzbmt2TnBD?=
 =?utf-8?B?ZWN6c2lkajFuZmxXUFIxWG56ZnZqdjBUNTZRV1RWbFRZZnVML1ZMUXN3UGdB?=
 =?utf-8?B?WS92N0F1NUYyYUg4TXpZNkFsNFo5YXp4MWlxNGlGQnFFVG9FUTQ0YXdZMnY4?=
 =?utf-8?B?SHJKamdqakJyZzQ0dk55OFJPK2tWdjhwcUw1WXVySUF4NkZsaWpGZzh3QkYw?=
 =?utf-8?B?d09DQ3lsSlVRdGF0ZVpsR0ovTThORlhSYUFQZGtFWGpURks2TFhNT3pIWnNp?=
 =?utf-8?B?em5Sc0RGQmtEZnVhMjd5TWhXVUhRaGZIMUpHaTRhMFBYWmNJamhjYjJ1emdu?=
 =?utf-8?B?K2o1dkdKQTI4cUxxZEtLNlhqNXFFTmJNTWd0aTBjVEluMTFkbGNscVhNSTVN?=
 =?utf-8?B?K0c5NjFxUVNwaDMyVFVOMW1vVDRnYVFRVUNWV1YvMnh6NUg2MW9wTGFsWW9q?=
 =?utf-8?B?RmZDbUpJOFdCMmJhUmgzejVVVTVIdFBGc285NFlxZHFYeW1KcDl4NjFjUER5?=
 =?utf-8?B?T3c4aDBndml6Yk8wVXp1dXlnSWhERmQ3SEk4UW5waUs2QitjVG9vQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9026993-8040-47b8-06a2-08dea5279d92
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:09.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iChikUrFTMnKxmsSvpVzvqYW8/l9NuQy3fTKV/TYBrxKDgTI9QD2AC1PVrZBN7jhK+NYDxcvDj5ohyCU7aw1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5208

This series collects all upstream developments of pin-init to date and
synchronize them to the kernel tree.

Last cycle Benno sent a single sync late in the development cycle, but I
expect a lot of developments this cycle so I'll probably be sending
multiple of them; for bigger changes they'll be sent as their own series
instead of part of a round of sync.

A major change in this cycle is the bump of MSRV to 1.82 to get rid of
unstable features, following the kernel version bump in 7.1. The MSRV is
bumped straight to 1.85 as pin-init can also be used outside kernel, so we
avoid bumping unless there is a need for new version.

Here are the list of merged changes included in the series:

- examples: mark as `#[inline]` all `From::from()`s for `Error`
  https://github.com/Rust-for-Linux/pin-init/pull/126
- bump minimum Rust version to 1.82
  https://github.com/Rust-for-Linux/pin-init/pull/129
- cleanup `Zeroable` and `ZeroableOptions`
  https://github.com/Rust-for-Linux/pin-init/pull/118
- internal: add missing where clause to projection types
  https://github.com/Rust-for-Linux/pin-init/pull/121
- internal: internal: remove redundant `#[pin]` filtering
  https://github.com/Rust-for-Linux/pin-init/pull/131
- add mailmap and relicense `internal/zeroable.rs` & `.clippy.toml`
  https://github.com/Rust-for-Linux/pin-init/pull/137

Here are the list of changes that I intend to merge soon to upstream
pin-init, which I also included in the series:

- cleanup workaround for old Rust compiler
  https://github.com/Rust-for-Linux/pin-init/pull/141
- internal: turn `PhantomPinned` error into warnings
  https://github.com/Rust-for-Linux/pin-init/pull/135

For information, here are the list of upstream-only changes, which are
related to Cargo or tests/CI changes only.

- build.rs: use `option_env!` to register env variable dependency
  https://github.com/Rust-for-Linux/pin-init/pull/128
- clean up dependencies
  https://github.com/Rust-for-Linux/pin-init/pull/130
- tests: add test for check correct macro hygiene 
  https://github.com/Rust-for-Linux/pin-init/pull/133
- ci: use tagged release of actions
  https://github.com/Rust-for-Linux/pin-init/pull/134
- ci: have a single job to gate all required jobs
  https://github.com/Rust-for-Linux/pin-init/pull/138
- ci: various cleanups
  https://github.com/Rust-for-Linux/pin-init/pull/139

Best,
Gary

---
Alistair Francis (1):
      rust: pin-init: examples: mark as `#[inline]` all `From::from()`s for `Error`

Benno Lossin (1):
      rust: pin-init: internal: adjust license identifier of `zeroable.rs`

Gary Guo (5):
      rust: pin-init: bump minimum Rust version to 1.82
      rust: pin-init: internal: remove redundant `#[pin]` filtering
      rust: pin-init: fix badge URL in README
      rust: pin-init: cleanup workaround for old Rust compiler
      rust: pin-init: internal: turn `PhantomPinned` error into warnings

Mohamad Alsadhan (3):
      rust: pin-init: cleanup `Zeroable` and `ZeroableOptions`
      rust: pin-init: extend `impl_zeroable_option` macro to handle generics
      rust: pin-init: internal: add missing where clause to projection types

 rust/pin-init/README.md                       |  2 +-
 rust/pin-init/examples/big_struct_in_place.rs |  3 -
 rust/pin-init/examples/error.rs               |  2 +
 rust/pin-init/examples/linked_list.rs         |  2 -
 rust/pin-init/examples/mutex.rs               |  2 -
 rust/pin-init/examples/pthread_mutex.rs       |  2 -
 rust/pin-init/examples/static_init.rs         |  2 -
 rust/pin-init/internal/src/diagnostics.rs     | 14 +++++
 rust/pin-init/internal/src/init.rs            |  9 +--
 rust/pin-init/internal/src/lib.rs             |  1 -
 rust/pin-init/internal/src/pin_data.rs        | 10 ++--
 rust/pin-init/internal/src/zeroable.rs        |  2 +-
 rust/pin-init/src/lib.rs                      | 79 ++++++++++-----------------
 13 files changed, 52 insertions(+), 78 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260414-pin-init-sync-ae407945a726

Best regards,
--  
Gary Guo <gary@garyguo.net>

