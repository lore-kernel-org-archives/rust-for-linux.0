Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021079.outbound.protection.outlook.com [52.101.95.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173749252E;
	Thu,  8 Oct 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462259; cv=fail; b=PmdvtGIkzahCLh2wTGrWHfbhiQ7rG8cQ5cZe8j4zbSFy625QHxKDLD7LVwlJvEorMP+o1G9HKnedPfDwHaOwb2XWbM1YBldpgALwxfioDvoJ1IK0IJLb5IvIOZXn1kFHclPEgfIAfMyyBsLmzksJ4d+mKZrNaxhO15ycFXZI8kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462259; c=relaxed/simple;
	bh=j+QSvrNhOO8K9E4dclxH4fhgLa8PwyoQLLfUb4cpi0U=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=c706MirjhG1zY/GEHWTJa/cHUkGajK49yL07vH1jgtgLN5fTomsfwyjTocPf439FL+w4kjJTP2IYrkPa86/S0GdujUIdPkPiMp0CTxFOXlgt5J8bH1qdxY67f4x1boKthO8bODO7trdiN6hogePwmE4qVx3vIn5NC0da8Ut/vEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=k1Km7Co0; arc=fail smtp.client-ip=52.101.95.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="k1Km7Co0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0UQdX/qzTPvK6YlpPAsutmV2EtbN8AFtj45rQzrkQ48mSiQ0SrkY3CrvA7ZbNfxFqU3VJWyXBcRAurEG7ifsm22JBMmXlnvjXRoKlCWTGLE6vmzv3PyBjQKIn9Wv5ota7YPX8lRodFHexYrarlTaJS29okwgyWexh1UIfxkRqYF1ZMO1wENji3fHVQdxrQ6TQrmfYJE1pIdVZJlcwTjkz2dd7sTzrymKLVFl6Yz2gEGj2F8THmjF5YoxFb6GxbBDRbm3AfGRbZA53IEqN0K1Y9SbPGbWtkdh2GvuOSW8jMIRVUyuVdmIxLR7Ofl9jhZeqn0OEGxT2iLXOdQNzou1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=js8ZJoK68spfAMn7s8XsRKRSmpTpQl4TG1DEbEZTCsg=;
 b=NiZh5iehpq9531z6v0WAJG+joYA51vBRqj4b/fZ9GIbK/NEeX9dIiCuAHEzlh84qs6ZTTqOF6Cm/VcpkHJ3JDJxpfTc1/bBZKEXFqz8AcgWaLrUYtjKXjz3+YNMTKUdcD7JrEgGmrEkib4VCNBvaeP8hTJlTZPWDvaiXUzQCP4yr/cH5ptPG2WnKiSFIR47Q7RQghMjL6glrvDvyWbXb8oCNfwPZXXLiDA301I7QvP9naVjHWz60WaofYAbBjGA4uPZXjmFbxVCZfGHEJLW3LhksmmWGjaLCpTzmShOVS3Rhw2bCfHPJWfWRtnrNB+a0UuwYh6bkmrH7CSBv7zA0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=js8ZJoK68spfAMn7s8XsRKRSmpTpQl4TG1DEbEZTCsg=;
 b=k1Km7Co0b6EttIkn16G4ARJABj7zsQSiDzvZ20pNCc4LQq0vB4DoKHBlLceKJH4G/CWyXJ0kPirwW0uAIr28bM26HieM6icKYEvIuLKPmC+hKHIxuZtIkW2VyX6LnPAj3mUXfAMoYvWk+u7QcXQaJDVojoZf6p4PO9YgISd3fPI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:11 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:11 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 00/20] rust: pin-init: create self references safely
Date: Thu, 08 Oct 2026 14:23:47 +0200
Message-Id: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOLx2oC/yXMyw5AMBCF4VeRWWtSJW6vIhZVU0YE6dBIxLsrl
 t9Jzn8BoyNkqKMLHHpiWpeAJI7AjHoZUFAfDEqqPJEyFz16wThbh1aowqSF7qwuswrCYwsjnV+
 taX/z0U1o9jcB9/0AB7zI128AAAA=
X-Change-ID: 20261006-dev-selfref-27c37abfa849
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4598; i=gary@garyguo.net;
 h=from:subject:message-id; bh=j+QSvrNhOO8K9E4dclxH4fhgLa8PwyoQLLfUb4cpi0U=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7Iz4e/7PnlXG2leKSA8vPBu+dePriMvfTCSxun
 mXR7MHhcQUdpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATCRvMcM/bXXzR02rHmQc
 XX9L+1T02sPsum7fUhPnf7CxbD8kp9PjzvBX7NvMCU1Xl7z8pV2w+HTGu4sdV/cfePsiNOB0q8v
 7LTe1eAAerk2J
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f50807-176c-4022-710d-08df25370ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|260925021311599003|6133799003|10067099003|260925021911599003|56012099006|260925022911599003|11062099010|18002099003|7136999003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0LaIIcF1XazOCvvocBS/KUHN+S6R+DVBWA1wGVmHpmQN4dIig+CANWDrGRBnS/PBD03CAuToxDNr1eEjqJIw22d4mwQFr1TR6uu7+/zhxfmsKhX5VmrDhmGKN4PuIKVV6BZeUmk7T/BnuM2+ZHrNe25ufCcZbAU/+pxPtWrcWGu4H3oh54nj6A6S1S0CNxQMLId3O5vkK+7ktP0j6Mrr+juc+i6wLDgAqKI61rNNhlpRewBD42UvsVUbpyCG/rw8yXvfcFI9xAuuXr1MsNRFZWYm94FC//P81v7HP0hqFlVTHJjHML+vqRA40ynnBn43BXirbyL40ebOWzV3M6kNL2GiIRM548KmO57Y56cTF6vKobsRSKhvrpHvHa6khrVEqq1UybAmrA5/ZXMy9Czs/hu+oFJfgu9mpp6+dWsqupj5R0aPmMFITIR8F8Y22YUfNqzPGgsst0/wfEAnOHKBCNKcXIcSSdc8OImk38NOhwZDmipduLl6DMngOXl6zY1WGAnEPGOzuRFZUj8yqlT+wkcJWbtS4J3FkX9A04kCMXbO+OXOHVzOjnSS9YzDYUlkWYBGxVx0KHvwV+q2ScYcsBSTzIlqqhFhDDsjR/tHC4OKplIywDbIWXQS+oyBInUqPA2VXCiXOnMRkJG95yjoduvLOPjLXZCE/C/eA5Nm07k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(260925021311599003)(6133799003)(10067099003)(260925021911599003)(56012099006)(260925022911599003)(11062099010)(18002099003)(7136999003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZRbGRDVzNlUXlVR0NZVWdmYkRwMStkVzN3QlNmeW1Tc1hGdXpuT2cwWDZK?=
 =?utf-8?B?dHdYSHdXOGVMeUVVb2VEcCtqM0M3WEVhaXA3alRkakVXUHpqNk9qTHJybG5N?=
 =?utf-8?B?MjZwb1BtbzNqVGxrVFZ4YW5iSjVlcTRta3BSQmFSN1dZN0NFdUtPUmpHT1Ji?=
 =?utf-8?B?blYrbjBLaGEyZUVXL1hWRkcvUXRsWFhkRGtxNS8waEVGTWhuOWc4eEFnSVZF?=
 =?utf-8?B?N0JpUkg3VExJNE9LQ096amhpYkY1NnhYSGZqV2Qxb2lBSjlhTzg1cjQyZ05a?=
 =?utf-8?B?cktuOWlnU25xNTFSUldMYUdmTnlGNmQvQnc2MkhNZFh6dXJ2cHYyMk1vN2o3?=
 =?utf-8?B?UHZmWVB3dWZheFJSYVlBcHAvKzFPZkxCNUZIM3VDR1Jkc1hUOE5vbFhiQklH?=
 =?utf-8?B?aG1OanRtT3hlUEVhNmtkUmJtaXJyU3JkaWRDV2tJL0NldHMvc0xDZzhML2py?=
 =?utf-8?B?YkJPSnZRcDRlUUVxZm92Y0Q5em9URElsaUtNcmVsTTBHUUZtTDZtV1VIOWFZ?=
 =?utf-8?B?U2xzT3d3RC9xNStXRFgxQ0tiTDRUaC9pUXVTWGo4MXlzVlVxVFUrNlBvTHhG?=
 =?utf-8?B?cGFzS1dSd3o1Q01SZUhwaDZyZU9uWkVUY25GR0lhRjNURU5UM3l3N0ZXQVN5?=
 =?utf-8?B?V3N0T2wzQ2ZnbUU0cjQ0SnNUY0c3WnU3OVRQcFhJWWZWRDE3QkZrc1pjU0J6?=
 =?utf-8?B?eFFEaVNTcXo1VnRoSmM5SWI5MkdYVmluZjNuL1JNVUozUmdtcWM4SWI0bXFT?=
 =?utf-8?B?b0xYN09FUWdqZFBkYnlCd3NVVkVCdTJUUC9YL2o5NGYvODU0SW1NNloxTklV?=
 =?utf-8?B?UlFhcC9aNWdWSkQxdVBlQ2FZUTVxaCsrdFNzSmpCUnZsUFhWTkUyUzV5S0V2?=
 =?utf-8?B?aDRwMG9uL1hveDhnSzRmd3VrL3VrcktnMTB0aDM1bGs3N2pkTEZYcHN0S1dy?=
 =?utf-8?B?UUhqWkg4L3NVR1pEeDJka3ZUa0J1OFQ2UVR2MElYdklPZTZQU3UvVHY0UldG?=
 =?utf-8?B?bjBid1cxZm1OSi92bUxQTFl1eW0ranBpMjg3bE9NN3dqeVZrRlhab0hjcmgv?=
 =?utf-8?B?RDY3K2tHNmFhU0NwVEN5dnJHMkFGL29XZEpia2NTUVh5OTJ6RE1ibFRwS0Rt?=
 =?utf-8?B?V0hudGpFRE1YaWJnODBSMXlSczRrbjJXMnNocUxqRWNCeHp3ZVM2UFhaR0Nk?=
 =?utf-8?B?Szg3eWFYTDdmVm9nd2ZqenhXSGc1aElqTnRGUXFDLytlODduM0paMGJSUWtt?=
 =?utf-8?B?cGxIalMwQjIzR2dib3hvNW1QRTJTTTExbkpOZEJUN2RUYVRxb3FtWHZUMXNt?=
 =?utf-8?B?SXIrRjhnWk84bzVNa01OUGI4WklBcCtXWm9iL01BcnZsbDM3S2JLOGRMbm9v?=
 =?utf-8?B?dGU2R3p3VUFYNTBvaDZuSUtNM0huZmJydmZ2M2EvdDl0ckZhSmtqUk85UlhQ?=
 =?utf-8?B?ZVpWRlFWM2swSzFqejFvbk8rQVRRVVM4SmpkRVlQOHNMcTl2c05TeXdXRlcx?=
 =?utf-8?B?S1B0TDYyUXY2V040TGFtaTAyYjRFS3c3cTk5aEJybFZWRWZEcFU0cDFSK1lm?=
 =?utf-8?B?ZWZpREZ6NnVFTDFSUUs1cWc4bjhsZllOWjFJMmYwT3p1U2VEaXdtSWpzUkls?=
 =?utf-8?B?NkdQOVovaGM2c3RSTC9qazZWSlVzWVVpQnk3QUZXWmdtbjE4SUFRSjNGU0Q5?=
 =?utf-8?B?UUY0MnhXUGhMQUN4MzhrVjl2Y2twWjdoSFJrRDR6UG1RTjE5ampFajB0VFJF?=
 =?utf-8?B?cXh3eGxCdDZZUk9GQWJ5cDhPcEFPSkZpM2tSREdkcE9wNzdERmRsQTAySkNT?=
 =?utf-8?B?RVN4ZmtaVEhLcTZrQmFubGlMTzA0WDR5Y3RURm1ObXA5VDNPUlo4VWpKUVdX?=
 =?utf-8?B?bE5RN00vcm5YM3I3akprWGpRSjVKOTNRVnBEM3RhTndBR1lmNm01aW52UzZB?=
 =?utf-8?B?UUM0M05NNVl1TDVVcGVWMERIWFk5NWtacVdkSU1iUncvQWY1SmlMU1o1QjBG?=
 =?utf-8?B?R21rN1dCWDlwdURIdHBFc2Q0Qjc4YkpGMmw3RjF5Q3FSU2E3dHZ0ZkxlT2Nx?=
 =?utf-8?B?MXc1THNibEEwdWpUQ1JUT2JFeEFoeFZieHEwcDRYb09LUy9PZWNQRHZLSHZk?=
 =?utf-8?B?aXFab1puUUdxdUltc2xKNXdLUHpNc3JwSTJ5dzFPY0IwL2xxNGsyMEZYRU5x?=
 =?utf-8?B?Tzd0Wjh5OVNpcXdxaXBGUTlCblFwVTZEY2RyQmRoSlhocjlDMW9KTFBSNkZn?=
 =?utf-8?B?VUszbFhieEhjWHJMbmFwS3pMdzFTaEF5RVZzUEZLTm1Md25ocElpR1I2aHQ1?=
 =?utf-8?Q?RwYW64b0fvmjzMTdYJ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f50807-176c-4022-710d-08df25370ed9
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:11.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yNs9YDmK0pbOWieS8+19TMpFJff1n8qpe8wm2q4gCXInfRFLJlZdqAslk31zO8aVBLhMnZAyeslSodyUzS0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

This is a big series that add support for one field to reference a sibling
field in a safe and ergnonomic way. Unlike many other crates in the
userspace Rust ecosystem, no additional allocation is required, thus it
requires the struct to be pinned, which is exactly what pin-init provides.

This is a very powerful feature, and thus can raise concerns about whether
it is sound. I spent a lot of time studying the rules to make this sound,
and presented durirng Kangrejos [1].

The simple use case looks like this:

    #[pin_data]
    struct MyDriver<'bound> {
        dev: &'bound Device,
        #[pin]
        irq: irq::Registration<'bound, MyIrqHandler<'bound, 'bar>>,
        bar: Bar<'bound, BAR_SIZE>,
    }

You simply need to mention a lifetime that shares the name with the field.
There are more advanced use cases which require annotations like

    #[uses('bar: invariant)]

to explicitly declare that the lifetime is used in invariant manner, and
also

    where
        exists<'dev>: 'a

to create new existential lifetimes as a way to erase invariant lifetimes
that would otherwise bubble up to users. More info can be seen in my
Plumbers slide [2]. Note that the syntax for explicit variance annotation
has changed following discussions during Plumbers.

The initial plan was to upstream the simple use case only and iron out the
advanced features subsequently; however it turns out that DRM jobqueue
would need the variance annotation feature, and Nova `Cmdq` would need to
use the existential lifetime feature.

During Plumbers the upstream schedule is discussed, and instead it was
agreed that all the features should be upstreamed at once, but the usage of
the advanced feature usage limited to the pre-agreed users only to limit
the blast radius in case the feature needs to be reworked.

Detailed documentation about the pin-init self-reference feature would be
added the following cycle, when the usage of them become more clear.

The pull request on GitHub [3] has a bunch of test suites, which are not
synchronized to kernel tree.

Link: https://kangrejos.com/2026/Self%20referential%20pin-init.pdf [1]
Link: https://lpc.events/event/20/contributions/2498/attachments/2200/4855/presentation.pdf [2]
Link: https://github.com/Rust-for-Linux/pin-init/pull/181 [3]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (20):
      kbuild: rust: allow `clippy::comparison_chain` globally
      rust: pin-init: internal: pin_data: infer self-referential struct
      rust: pin-init: internal: pin_data: rewrite fields that borrow others
      rust: pin-init: internal: pin_data: pin borrowed fields with wrapper
      rust: pin-init: internal: pin_data: teach drop check about generics that cannot dangle
      rust: pin-init: internal: pin_data: self-referential drop order checks
      rust: pin-init: internal: pin_data: check covariance of self-referential fields
      rust: pin-init: internal: pin_data: implement initialization of borrowed structs
      rust: pin-init: internal: pin_data: project self-referential fields
      rust: pin-init: internal: pin_data: add `with_project` method
      rust: pin-init: internal: pin_data: enable self-referential support
      rust: pin-init: internal: pin_data: allow lifetime to be shortened per field drop order
      rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` annotation
      rust: pin-init: internal: pin_data: support mutable borrows
      rust: pin-init: internal: pin_data: parse explicit `#[uses]` annotation
      rust: pin-init: internal: pin_data: make field lifetime invariance imply type invariance
      rust: pin-init: internal: pin_data: complete invariant borrow support
      rust: pin-init: internal: pin_data: perform AST lifetime replacement if possible
      rust: pin-init: internal: pin_data: support shared projection
      rust: pin-init: internal: pin_data: support existential lifetimes

 Makefile                               |    2 +
 rust/pin-init/examples/selfref.rs      |   60 ++
 rust/pin-init/internal/src/init.rs     |   42 +-
 rust/pin-init/internal/src/pin_data.rs | 1556 +++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  268 +++++-
 rust/pin-init/src/__internal.rs        |  357 +++++++-
 rust/pin-init/src/lib.rs               |    1 +
 7 files changed, 2238 insertions(+), 48 deletions(-)
---
base-commit: 0d9aa4b994379c6e0099737221ed421deb7e1a31
change-id: 20261006-dev-selfref-27c37abfa849

Best regards,
--  
Gary Guo <gary@garyguo.net>

