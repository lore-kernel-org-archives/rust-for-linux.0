Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022087.outbound.protection.outlook.com [52.101.101.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94C5B206;
	Sun, 11 Oct 2026 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761455; cv=fail; b=nJTFOHfCvVoSvDeXm51FFDTrUnJC8LAst5NjkMTuwqKmO+gZR/xbdRtUc+XZTbKxrAON78ymTraz5R8f55JuOMOhs5xz87nu0awIFLjyxL/7fcmKXMvf2yy2hgqz3xMwnLL7EHe6/jbitT4cjqil+HmF5k76ZbxMcHHs4adHi5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761455; c=relaxed/simple;
	bh=6SXjULw9GWkZHh7TPvkCQScSdDXdZPN0Ga1fviRDu5k=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=pJ4Xs5KA0bDNh5wk1Ttp4Mv+YEuXW6sYxachSCABc6uSj4f4L3D5XzzSUT4A+iPRqSNZfbx/7p7j0vOHCS3DDkO8MADd6qHbZnIrOjnvbVls6325F1lGs1ad8Ln/Ve+0S4QGByivu68Mo8Ok9CMjngmrrbPclYmCi3Fc09K3hkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h7I30oip; arc=fail smtp.client-ip=52.101.101.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h7I30oip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhA7HDvvfVrI4qY1fimEljaObH0Dnma9XaXeaLt6/fnQ84Xiy+fpZp0mkXnesChckalKForEoWV+fXGyDnE5bSlOIz8tuZSAzqX+oHiJD8OIW9L4s3DRd3DBek2UQXBdyxXOZiLaG+T9wp2Kfya9l29K/z0EbmCz/B41i25vZ21A4Pv8GANaaGElFcziKKWbjU+VSCZqcl1hyyzEp6z/+4Gqq9AYEaCezE3NlE/l7RvHuU1qpWG6AVahin6J+IKSvAXcZHWjooDi88WeUiYIy/yASLxwJ7t9bBdw6If3R/F7blpg/jpew8yP5qbZcAJgj5bsLh6FLGQfMkODOYzpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2bTwJbS55A/llfbV9Rvlgd9PnR/aMRXB6bITbX7Rw0=;
 b=UsGcHql7CmZJ+X5fzlMJ/5JpP4J6vIBtiHkJxLaZSGt83wPGPlTY5GBYaZvrDyImY29m4/PpHsEspbzQTnN8gSoEkEd+CCEF7CHydasmZmbsjMJar3WuyXFEvsAvuKYDPmd8rQzPzpJlxhAvXi/7V+PLPjXQMI92oRrq4BrpSQKUYcRxkEd+Sio5vXkAgLhBlyNlQ9au7kai0H3rXl1C5BD/djcA/XoPoXdrQu23LP+mLRw0205FrKpjgAO4r/aJypkMGQj0RIJclqxEs4i0kKcjfP2tswClXWcY+XGQeTji+jqcU8VRUGN+Wr59FTdniBVuN4FVxoRzyzVRpTzf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2bTwJbS55A/llfbV9Rvlgd9PnR/aMRXB6bITbX7Rw0=;
 b=h7I30oipXbpg4qaZAYBJt+TVQ5SgqNlzpTd1r+/jIw5/PLctlmi9IUIC5J7+jEIwQyKsRRqpMVNoTmeYQl3kYwC/VR61L5sza1RaC4DUeuK8o7x2BdGSFavPG2LYGM8ZzqFJ8Kxhn7grKTEnkvfbzLmyz2ig+QdgQIJxgCwGpKY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB2140.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Sun, 11 Oct
 2026 23:30:50 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.020; Sun, 11 Oct 2026
 23:30:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 00:30:49 +0100
Message-Id: <DM2EFAJY3CIX.24PPSQQZE0TEW@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: internal: suppress
 `explicit_outlives_requirements`
X-Mailer: aerc 0.22.0
References: <20261011133904.600785-1-gary@kernel.org>
In-Reply-To: <20261011133904.600785-1-gary@kernel.org>
X-ClientProxiedBy: LO2P265CA0492.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB2140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7e64bb-4280-40d3-0950-08df27efaf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|366016|376014|23010399003|921020|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3IJG5OWBMz7tg4aH0yk3IV9edGEYdHcJcV2oBd3ZQZhzX6o17LnGElCdBdvXdSpkFf19njKebkZbgKfYKtl8wKs+l2VX5BwIlsY8Ro8x3xVcF3c2G0jrx9z3bGP1xfyEOIgwnUdR1lG2M7S7lKq4B8UCf9MGFd5LyrwJAoz56KEXgqQgPwnVKEJCv1Q1o3l0bnstd59wmCCDGmoeFULHqWTszMISCSf48MSU0p8elyZ+XFpjM0ZZ6HacUg/TLER4jQ0DK8MTKvZDHvd5WxZ/KTluqF3cKJ0kXmK4at8JJ3D3Ci3ZVn6H/nYAhuk68nrFlAlF3t7xRhTQffod+BCXGLI0u1rk+AbMPP9Uj+ZvxuqQHx/PIzoAEGs9vc7GntX5L4ViKxs3mnKu4yRrPI4zVkp3uejz5CJi4+DTSvnj8SHrf8KIJVtpKGQWVrpwRG0DXREDEAMghcbG06mhh9GEDX/xtxwfhI7J8TUCu6lYGIWmhvV84kEMz/t+r3IrI/aBv3XTWX/tLQALVAgyH+TKgq+KpA6idWYOkyLxT0bk/rUFXuZ2z2iFU4d4MKuQ1qpqhibCdGS2Xqdw9x4eYoXiyWwxsFB2ecLd6RTcJMZLkWO8rL0xgZf4M0jDHrpMiXDLZLO5NdHOXEOB4vyfkghVYe1E+okNfvQ4mHQuYEfbDPBvywguOhoWp2hTKpBUPuvjwhIOwBS8p0+pVnnA3qilgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(366016)(376014)(23010399003)(921020)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRNTFA2ckdHaHhTa1BzT1hmaXJkN1B2WTlSaGdRWUYybGl1MEU5R0FaNksv?=
 =?utf-8?B?UEpJMU9XY1dLRFZBN25yQXVBZXpxWFFFeGFUWGtaak9vV1N2NEMyQmZOdUNN?=
 =?utf-8?B?dU9mM0J0ZVhMRXdEdWhURnM3YXFRcE91YlFVWldPYU1nL1pqQUo0WG56bCsz?=
 =?utf-8?B?M3E2enVqU3hMM3ZTbEVsazRnZzBjY2ZKbkVwZm9TVDV3dEk1SDE0by9TZXJS?=
 =?utf-8?B?bDNMT0lPRkZld3NiUitxN2pGbXZXTWtxSnZJUGxDbTBMMDZyS1VVVU01eGhq?=
 =?utf-8?B?N3plNEZpcER1aDBIc3FHY0UvTVVud2Z5RzF1ZExlUXRqMytmQjVycVFySXpa?=
 =?utf-8?B?VndxS255c1h3dzdENUFJcXliVkRnWW1Bc2VhNk16ZXY4Q09tMkRjRzlYRlh0?=
 =?utf-8?B?d0R4RlFnTHBXTDM5amY3dHZzNkt4OG9JcVJMOXQrdlVzd2I5WlVjTFJMVXds?=
 =?utf-8?B?Ym9hKzBWcW9ONlQ5UGpnYWt3SWpWaVNPT25rTnZUc1FkN01Tei9MQkt5TmtI?=
 =?utf-8?B?SzAvNTNmY1BrR0tBV01aT2k1aUdHS1FNdDdLb01wTlNrb1dxQzA5SDNkZ2hk?=
 =?utf-8?B?M3RNeTJvOG1XaWxKbDdOeTZySkw2TTFBTHVHcmtSVC9jeHExbEJ2MjExZkww?=
 =?utf-8?B?WDR6ZlhtYnBSc0VSaTd4VjB2L1NzVXNIY3ZDcGExUERodmJneUJDNXluSjE2?=
 =?utf-8?B?a0htMnNXVDNSeENUdXJFeXZRSjY0VGMxTVJZS3dQUlY0bW9Vbkc0dWlyNitO?=
 =?utf-8?B?OHFWMlZkdnpmTUtuOGU5VHdiV1hCMlAvV0R3OUlpV0Y2Q0FYU0JJMk1lL0Fx?=
 =?utf-8?B?Tk5hc0U1cTlLYmp6cDRUMzlDaW1jK2Q0d1QwdDRVc3p6TDdZdGJzVUhtb1FB?=
 =?utf-8?B?UE01NVMwN1RTUjYyUVZxK0g1cVJTY1d3UHFoT3Rzd1FqRjY0T2dIZkRINXcz?=
 =?utf-8?B?OWV3czJPN0Z5KzhtQXZwZjZlTlB4TUpwVzJwYlNkVTlRVDFBVDdHTFJoUEky?=
 =?utf-8?B?TG1yT2ZVZjNMMExyMUdhWEJwQi84NVBad2tjUW5OU29sSkNORGtwTVNQM3Bu?=
 =?utf-8?B?M3kyeGs4U1RwcmNXaksxRmFaTlU0UkhETVY2M0k2YkNWQzNEN2JQMXJTaXlm?=
 =?utf-8?B?a25EajNsYW5VNzlSdW1ibVRZdGFsVXZQTGZpNE1nWTV3b05tV3k1c3lSSDJW?=
 =?utf-8?B?MFNTb3ZzSGhKVzA2UjZDdlZGajFpUVFPc1lYcU14bWJNY2FNaDcwUkxpSi9a?=
 =?utf-8?B?NXFwSHlNelk3c0djbUYvVmFuOGZUUkF2Yko1bXVsSjNuWUw3aldxbW1FdFlZ?=
 =?utf-8?B?RTBPZGN3S1pnV0h5bnhnR0NXWklZeHduVGNHSS94QUgyNVdEYlVlVlNBTW94?=
 =?utf-8?B?aUVSZjJ1ekhHTCttVHN6NzhaaFdUQzUwWDB4TXlhZFZqWTBycFFVTVF4QmdJ?=
 =?utf-8?B?a0VWbml6bWh5SWdNQmV5QkxtTUIrUWQrbGNYdURPUjdmRmNmaXozSWJSU0NO?=
 =?utf-8?B?NUpxaGRWblRUMjFEdjM4bUY2ZE1YOTA2ay9kWlQ4OGlhRHUvendDU2czcUs1?=
 =?utf-8?B?RHhHR09jMVFPdzFsaEVaVUpabkp3dHpxeG9EWHY0RmtwblVCUXdkaHg1aVB3?=
 =?utf-8?B?MWdtYVhBL3l6SWo2MGx5RFczNVNROUhYYklLYVdjWkhrWXFMQithK2V5Y3Bu?=
 =?utf-8?B?V3U5emt6MWFPaHdGTHBRak5nZEk0ZTBKZk1kYTZ0VFJpN0pTaU1aUFRDbjlZ?=
 =?utf-8?B?dU5QWXh3dTNjRnFOME11Y2l4MGt4T1BwbFRuUTJPeGdYUHEvZE9vaU5UR1Iw?=
 =?utf-8?B?aDNuM1NqSzN5Q1lDSFBZOUYrZFE2bXNnNEl5RVpJLy9ET1JSSFNCU2lCZVFF?=
 =?utf-8?B?MUtGamdBZ1VnYXFNZUJSbnlyZkpsU28xSVA5TERjb2ZZVGFnZ1BQNUdJN3JZ?=
 =?utf-8?B?RWN1Sy92TVVKVzhveSt2c0hPNlhYV3VBWFJpSjYyZ3FTL0pad2d1OEd4WEJr?=
 =?utf-8?B?bmZPTlAxZUN3c2NyS3c1MmRteUg5aFVLSlZsRjBLOVl3aW80dWp5cXB1YlNs?=
 =?utf-8?B?dUMycmtvQ0hFUWp6RlNyZVBMNDREU2lKNmFzY3B2QWhSaWo1T3VPbXozRE5n?=
 =?utf-8?B?ZS9kMkJyNDZXQWRMdjlDNzF3M2kyRXJRbmJnRERQWHJTckZnOHJyeEZEeUJU?=
 =?utf-8?B?WnJSNFB6Y3RGS3FicHhlc0FRUEtiUzZVSE9OSVdVTkJGNTlmNTloeVdqTHZm?=
 =?utf-8?B?cFhzWi91TERkQ0JFd2JpM0Y3dnpvd2FoWU9ZOFpOU1QzS0hiMzJUVFY2Q3lt?=
 =?utf-8?B?Nk5uMGhmaGhydEJicXRoeVUyNlRLdHNmc0ZQYTZwTkF0UldNWEROQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7e64bb-4280-40d3-0950-08df27efaf2c
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 23:30:50.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzBywcyOwwWZa9HLshK9OkIJP7OVNV/5D1wwHum/lE3ckST8fYJShSKttjB/qidj2ie1hg0Vf0N89054f+8fIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2140

On Sun Oct 11, 2026 at 2:39 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> `#[pin_data]` inserts outlive bounds between lifetimes to allow closure
> callbacks to rely on their relationship. In some cases, these relations a=
re
> implied by fields, and Rust generates `explicit_outlives_requirements`
> allow-by-default lint, which is turned out by kernel as part of
> rust-2018-idioms lint group.
>
> As `#[pin_data]` is a proc macro and it cannot know if the bounds are
> already implied, suppress such lints for generated code.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to pin-init-next early, so it gets picked up by Monday's linux-next=
.

Tags are still welcome.

Best,
Gary

> ---
>  rust/pin-init/internal/src/pin_data.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

