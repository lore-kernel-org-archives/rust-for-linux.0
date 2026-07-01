Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022094.outbound.protection.outlook.com [52.101.101.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E1349CFA;
	Wed,  1 Jul 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922247; cv=fail; b=TCTSxZGMLws50OiTGwKxAlwll5zClKxq1u5Y/gFL+IQfRkO0GFAVwSqRQweIdq5Tifsyckm4nUhxpdWhLFzAdm+UwJXqD1L4/Lk2A8Tp7tkS/kHFrjj95eOElBa50QZ/5saAm+TTK2iiq9tRfgZUne8i/nGtqXc/b5UMeZYtQHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922247; c=relaxed/simple;
	bh=1eBdw6N2cob3ULgp8BJjL/inpkGRV6UNgBXXLKvV8lc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NorBi/WWZwpUyJHnjBPLaj69tboiCnJdyT0EdJSVX2HwMxP5jjq0PJK/rPvolOKewINWJt9ZMdZOtls4SvyzUp9/k/w52vNCus52ZYsZZ3aPuOK/wvA2rg5f9Xa9NcqqiXLPWsxkXETZjyzb9i7s0feinxdGEDSUt7LvMnFi4B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ywbnTBNu; arc=fail smtp.client-ip=52.101.101.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ywbnTBNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCUYhJcHJhxPCMBzqq/KJWUer++UWYziAb3dj6HW52lx2ptk1oY75D905+XV9P4Kb62zM2+gG5ksoKb6bv1irNRV1MZbBMhvt0g/K0YSPPu9XAmkCT0yirW2MMv/TNAfIbOJEdOefMKku2jKwzN1GutR7pl6xnig3eRi53sl0DLEe0Nr6LLivz488qrCq5tp3Rjtvh47z86osuyjlAzz2A0rACOFz3MM7vW2uSfiI0iMYI2NnPgN3sOS2RGl4IpEdTHbtikHq/yLxd4ZyvT1jPm5ApwIPmFr0qBNCzFfxxaRrHbTvtq0h4q3tsT5FISQUhMExHUaO2PNfm+47kO5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqEa7kxMtzRvO1p040LibjvoeQF7JCQPYKEkB+1mTDM=;
 b=KKgcCFzxTuwY3jOCCqz3vnlknet5BLmif3gegW+1rreoN7Rkhi+S7MASLVquseuEYtTi1cgndnvO7vQ+nHUntivrNpFFckCzrFR0Gicm5Rs/MVHgWmlggqrRwsSyUyEJLixcfPTqn52xV81Ug2ZBKhsFl5tesLI1dplOkebLPpB6+lDmeSWTn3BbdGMm8DwF/CXDb7/yxF/OrRm+ZxPOR5KfRhsoL+ZRbIjItHerlGUWCDMfoExaJgDHTDLAANUDHh88mE2Zdd80o0U2Gtm5UMn04SaOgi+FBJFRh0H47Oi9eu9aTFta2aWH0lLy6B2kN0K/zR2oxl5tuafBs/xGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqEa7kxMtzRvO1p040LibjvoeQF7JCQPYKEkB+1mTDM=;
 b=ywbnTBNuK5UebwJXS6V6OVtYbQ6apGnwwAD1jziSAI1QbKQKKiF6/4vOCZY94Z7fNB6uqQyPmiixzKHga8NLfEuknIvjwAk+vU37PxSJbaRwPyYRbrZ9oA5U7YmCo7MVAG57/YawyFOFfx8NBHnwlpIvcn1y2SIOjQSXFPaOz74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2194.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 16:10:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 16:10:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:10:40 +0100
Message-Id: <DJND6Q63SWUQ.2BPVF03OS6385@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/5] rust: sync: move lockdep types to
 rust/kernel/sync/lockdep.rs
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>
In-Reply-To: <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>
X-ClientProxiedBy: LO4P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2194:EE_
X-MS-Office365-Filtering-Correlation-Id: 066be259-53f9-4464-72b7-08ded78b4c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10070799003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	xglfblUpofCkwJimtGsHi8RA+sPSjl4o5z5EE2gJKapZOK7sc++HQKNEwddyq4XkcRA3n6qpAUNmrDnfk8WUB4CNqgwl+5WinZyqcr5GINUaSkb60/7FXg3Xu3+KNlEgY8ufmvHtQWdgC8phYazQwXzB4XjtioVWwXI+4MAUYMO7/Vd3acJ5wa+zvlkR/RwhhDjLS0XI8gnppmz7Q+ufZqcxoviQQI2ZbiauXbt147tt5UR0GQy0Z7b+KlWWT7v+S1UP+wKP5unamqG16qPcROsDtWaGkmmtEhBBA7W2NkJCjStoRxGFa12K5p4Jj373l9/AYNcrwzZ2iQjTVzpDp/rGl3jaZO5x/QvpBvgQ+8p+ScZPCKjrAm6Sc8lRIhK61D8GWBRjZJ3ReQZHsZZPFlMKApcjKtXoebTQ+tjaMd287Jh3/SbsPCvCHgb4Jrnh49devq7Q9oQKrq8EuwVl7Dd7djwPecKPaktcn4+wPfsb+7ZDm1VS0DD+Lz8AZ2lI9xDdyIJM3rITWBU8FC2EqWzH/SXkh49PwvOvOrF1F6U0HQczwJEAwrNcruc8v/tszojSvGI/jorLE5LkCXB+Zsj7Da/vT3N+A0ZVe03o6MMmqIwFZPH1kjAJlTcA//nNr5cXoH/geKQjPNkYff64zycbYJFCjw3qMsYTNJ9k3zo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10070799003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1Wa2J3K0IxWHZ1N1pmYlBIU3hGN3dwL0Zmai9Tb0JHY3dXR2ZhdnlvVXZ0?=
 =?utf-8?B?ODZHL1NzYkQ0NzNHcG9waGpVTWU3dzVlUlZwL3IwdkMra0laTVFKVVBPMm03?=
 =?utf-8?B?aTA1Q1JSNnh0eWRUYWNpbDJ0c0ZkOStjM1F3WG1nZW4rdm9VUkw2T2dFQUpP?=
 =?utf-8?B?Qjl1ME4vTUZmaFFqbGlyVkE3WDZqcEtmaFZCNGsycTZhRVBNT2I5U0xjeEJw?=
 =?utf-8?B?YXVkOHVqTTZzdTg5d0MxRWhZeDhkaHRkUUh4NlJDVmUyc3VJdHNLTjdJMGYw?=
 =?utf-8?B?bjFDeVdMTDZlbVorQXZKY2JGSlVmeVNBc0k3OTdmeXBHOW9VbFFWbzJPZ0dG?=
 =?utf-8?B?MGtoaFNtaktRNnFIWUg0VE8yM2diQXF2QXF4S1FGRXNxVHVkV1VMc3pCSG9R?=
 =?utf-8?B?dWVzQS9DTVVYcEduZjd5TmZBcjhPU0VkQTE0RXNpenNKR0xHUy81TSs3eHR0?=
 =?utf-8?B?cEJLaWdYN1hCWFoweExwRGQ2dVoyQlNKUytKTWh1aFZuQmJSQmVuekk3eVFo?=
 =?utf-8?B?NDNJa2tLaWVLeEFtSUZoS1BXSURnNDc0Ti9aOHdsMU04eUhhWWhSeHkzNGhv?=
 =?utf-8?B?eGR0WWR0SWk0VmFtQUZvYU13ZjUwTjZPQjNaU3NKZkFHZlBwT3VxZE1hZ25C?=
 =?utf-8?B?ZEw5d3FLd1EwcnRpZFQvSHRvSUFobTMwdkFQdjZvS291K2JRN0x1MzBMSTNG?=
 =?utf-8?B?U0NGbnhZOUR5SHBQR3FPQXNOazVWNzJjenpiQjI5UGM4ZHpCOUpaS2JWNEtN?=
 =?utf-8?B?cTJuRDRJQkZMTjRYaXYza0JmcDdxMjBTaG8xNFZWUTlFMlFGQWtYN3hsNDA2?=
 =?utf-8?B?cnMyc2o0S0s4S3Q4VkN5TU1reEVSeXBNKzdGOW80NXJGVGJFMUJzRGZnV1hx?=
 =?utf-8?B?d1RUaWMzZVFRYWR4VDJFbEhWcG95ejBnZ20vbEUyQ1YxRm1aK1NLdDRnUWdO?=
 =?utf-8?B?WEUvS1ZFS01YQzRUSnNrOEhRZ3ZvdmxFOWJDWU1KSXNMbFd4VkFTbkgrRFhO?=
 =?utf-8?B?WFgzRGMrL29wUGt0OVplbUpOSCttV1J3d0VENTAwdGRJMWpZakNMRURhbkU5?=
 =?utf-8?B?VUM3QW1nS2lsRDZYQTJBb3NEYXZTU1ZyNzErc3I4NVdRTHkvaHNvb1A5NmJm?=
 =?utf-8?B?UjZUYjN3WktxQml6alkwR1l0SS9MTSt6bThQdXoxN2FqQlpsVktLZDFRamRm?=
 =?utf-8?B?ZE9oMTF6bVpodlVxb0RERVk1QUxqWHhwMDV4emVGaittcGwreFRaTnQ0aURo?=
 =?utf-8?B?YUxNUE9HcDNqNDdNdjV5dFF5eDdaeE5qcUhFUzd4cHJsenFjVlFYNUtlZDIz?=
 =?utf-8?B?NGVrZzQ4WGNrekZHU3NIaFBZT1FRVVBMOGdldXk4T0xWUmZvNWlLWWJRVWh3?=
 =?utf-8?B?cVlJUzAreFJRUENEcnNkM2FrSzRkQno4d3hxRmVIZzdrNnFDUDZzVXBnQ3FH?=
 =?utf-8?B?dTU3aVFXVzEydE9PK3ZZMk9aQWxOZkNVb3BEazVvSVF6TGt4VXFqcGVzLy95?=
 =?utf-8?B?dG9LYjM0aGw5bWxLQVk5d2JpYkl1MEFtbVhidmx3RldtRXdNTlRLclByZGFX?=
 =?utf-8?B?emtKTFpjb3JEK2V3djdlOFpVWnIrRFYwRCt3eG5pR3ppOUsvRHhHbmFOYmov?=
 =?utf-8?B?bkQ3QUhmV1pCdm9CSEZKSVhSY0JtZDNLbTcxODlGcmtQbGdpZjdpL3luQk1M?=
 =?utf-8?B?VzhCWGJYK0tGZTZISFhRZ0trQmRZRlRFc2R1Y2xRUnB5VDJ0cGd3NDVxQmpQ?=
 =?utf-8?B?MXlrNHBQNkFDWDJtRHNJVjdzS3VmZ1BBdUQ0MUxST08wOXh1YmlPYzhWUjZD?=
 =?utf-8?B?VVJGRk10SUVZbXFrV1ZrMS8xZ3BydnZiK3NZSDdFYVh5enZYUHR0WDBNaTdF?=
 =?utf-8?B?L200VTkxSGdRbWVjT0J4VEhId1BCVWk4QXlpcU1wRnVILzFmbGMzS0p0Nndm?=
 =?utf-8?B?dUtmbFgxcGxPbldLeXRrdEovY2lwUzIwT1FYaDB4Tjc2eXJhbHpNQlN6WWhk?=
 =?utf-8?B?ZlFwUkxDZEVqUlJmUnYvYmFaY29Gck9OR2oySFkyTjZiYXhPRmkvMzdYdlh1?=
 =?utf-8?B?anV3cUlnaHdMZUZVd2gxSjVkcVdTK3NuNWpUWlJPWkZ2VzY0bUUwOHJBM2hq?=
 =?utf-8?B?U203emxEaHYybnRreUJIUFRndXp2MFRWL05ZTUgraFRlVzZmd1hqWGZBR2lS?=
 =?utf-8?B?Nnd4TkNFcVRoWFM0TXYyWFBPU3dVd3JqVDVJUEhkRk1uaW42OEFMV1pQbzJG?=
 =?utf-8?B?cm8vbWNrSUVQSUdWZ1pRWjIyVExEUUxYKzhrVm9EZXltUGR0TjVLWjN6K0Zi?=
 =?utf-8?B?dmM3Qmtrd3lnQ2RpUG9CWDZYWHo0WWM3amEra0NSUE1UWUxpT004Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 066be259-53f9-4464-72b7-08ded78b4c44
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:10:41.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY5NzjxXJa1+C3ILXIgQXWS3b3nuvHJ927eMZ2LjfdxZVO9/pLLAL+qob7tjY2u/mEQTQgfQsoE0ns9xwxFf4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2194

On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> The lockdep types are currently stored directly in rust/kernel/sync.rs,
> but there are starting to be too many of them to keep them in that file.
> Thus, move them to a submodule.
>=20
> For commonly used lockdep logic it's useful to keep re-exports in
> kernel::sync, and this also avoids the need to update any users.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync.rs         | 135 +-------------------------------------=
----
>  rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 141 insertions(+), 133 deletions(-)

