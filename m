Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022119.outbound.protection.outlook.com [52.101.96.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7244E433B;
	Wed, 16 Sep 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584129; cv=fail; b=HlLV6Md30nzPZeGXc7UZHVlbTxF0ogQarQkwOynGW+xWXKdJ2Q3/VSNGltth8XecpGKC2RWsV19gN61TTX2uq4Q0NVTlCv4c1T+lVKSRebGcAFKRXPS9kpKq2n0P9M1ftyngyZpRX3eQ3LOd2vl5LLpc/jAwidbDQY20EKziTDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584129; c=relaxed/simple;
	bh=k43PUx0891FzbbrRtcwcXA6ZtBr64ZGfSVdei4SgYsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUUSrh+8SgBlWmogaZLemWngzIdsIMEoleiD9sbtZtBsEl9FbehJVPHLqIe6dqB14G1o9HKsUTqAu8FnjOwOAFvc+1EK2wTYo7aClz9iCUKxa07yLl7WDxUHgO1EDhzHUo0B7DxoZQxbvKgfZTWAPmn6Wq3a7f2U8TJLSAhu4Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XNv9aMsJ; arc=fail smtp.client-ip=52.101.96.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XNv9aMsJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcRmr7TtLohXE8Z8RWQ0dOGVuhNEpGedfoNWWhfpW3Qej4UTu9L4hehqkls9rsOCQQ4/We0zKprwY9zGA3ZsDI4pM9nkXZrqzcUNrF3Wn2+yCNaewOc3ml8XuFwSLoDnPBql9gDD66vY2hNI+oTrMX5dzRtMYRaWpL3PxPW+WaySMus9TAjHIJw/L4ahfHN2IBtoUAsabH+7iDXl/dhH4lX98GDSmSn4YmQFqJV3jeKOJdkmpZ37noLXclUnCDhE1j2OJArn1dKge1SytvsSKtW287cU5U4UaagSrND1uoVMKPMcEPbXtOv9LQMJwJ6YK88/2gz04qAHMWSV4YTEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4obBBvvOgM7dEw0jkj6E5t/dzu2jk7RWFjFZdCHTpo=;
 b=gVGP8/DawZq1MDJFUSNhVJGxdM5JhgW/o2LUI9VbZJsWwucxVAPNs19SJ2fmBbe4XfCKO2CbyB85asXZHy2D5zKZx3hj1MJ0EJ1a0fcalsOjTb/LaUvTA24UnBxSoJZKz87oeKblaTqZht8JbkgXUgZJAV8bB39bO5Tnq89FHchJLB9gDMw+wzFYn/C0cRskZ3tL8zlA1hPEdapqgvRi3jucI+HAAKzfZUIL9tDyhnrNUY3waZk0HZwrQCRCtnl0QPWkJaDk8mmtTAbfrjN74kOxBSZDHDQJFfv+cbr9mBPTtictSAeTCgZJsIu3obKPcnmNNGHklLfmTaKjH0jMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4obBBvvOgM7dEw0jkj6E5t/dzu2jk7RWFjFZdCHTpo=;
 b=XNv9aMsJU2vQPvk/wKcj2gS38ilQKpb6wNIaH4deQT6X7/l7VsJH3m/T+JVRXyORGZasOqLaoR/JkO5tfyGjWQTZU6GYFCAEGJ4BTLjtKNrmMkYIpvDTAbto9oum6arB3jeBRPfs01FgmQb2OVDTDcVrqLf6gcmBAcMZy4XM25s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB5236.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Wed, 16 Sep
 2026 18:41:53 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 18:41:53 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/3] rust: pin-init: util: use span of `Index` for generated identifiers
Date: Wed, 16 Sep 2026 19:41:30 +0100
Message-ID: <20260916184131.435059-1-gary@garyguo.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
References: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA4P292CA0007.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::12) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 97502729-63bd-4f39-a7e8-08df14222d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|18002099003|22082099003|921020|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0Cv1JAH0wgh1G8P1sMBMoq4VDtNwuBInglpIa7w74I+F/z/3BGprBxhilAHtfi95Bb7d/9ohAsBznxWEox7NvmrEeWiAsUQ3X3AHcZVHTNOWRGSAJsj4JmnW0DSe6/YqPjxUD1Z5STbnWFGfllBiazwo+6u0fAVW3LcQuEe9Avr+ceL4dAV/OAUzNCdpb8dUD3i41RI90pdSlGQRyJk2tqziVxo5LkqDxosTK6FMH/VM/34cIA5MA7vUu3v1/Kja7RBOhkgk8zjWdNnRqwHFrK1L4yxiV+kjohNc4CcO2Bm5DM7r4rFuuQQXpl15lZo3hvXJxQZWUI1clYVP0XFRO8vd4NaclOGNpdTFVPEPx9YVY1s4bxECqTrDm7kxvo8JH1fCsOvEs079lA7x1EeQn51AS0qrUBHtyhJRYnAp6vkBvY/dYfAxKiw+Ast8xgaAVDkerHm6Y/4oHQWhXA3lJsrxLHrlOOy5e57LfYN1CQAX6zCsh+btWlWWVwfMlZkOpHoIAQnWCfFzq8jRuemLmGRfR3GsJ2xVSE8xJ7fPwb18EiYRstqN6OrenZPDAQzc7IapwLr8rbQoGe9AjvIhwsF84sgV3dl7ZWtt1A8UPtQDgQ3rfqKjQdAEtHwq6BgI4yopMW1dyZBiWjjdlOkEb0AKd5TyjVid7QwAWY5iHXuEL2eB6/u0kuiRhIPOTAp7BCa4l7tn+3rKtD8i+LU35Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(921020)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rv1KZFc0SpsCE3qiPXLvocfT/2s8Qf5s1R0aQU7V1w2a4YmWeJB8VjPH2JAv?=
 =?us-ascii?Q?adtJ3lIUW3pmRFnxlcSH2vFC6jIP7nWMQe0ChnBnCYWZeMIhAdSdO0rF8kPj?=
 =?us-ascii?Q?Cgru42zxo8FfgKPOxdIg5d9WiV7kqCH8zT2+7RypT74GKWF1naWRT0AswTcj?=
 =?us-ascii?Q?90ELE77ApFtLjHdTNttqWwTxPZFFOsKUm3unRgCOtBPRqT6MGehurdKpA0Se?=
 =?us-ascii?Q?5rqyLayPbeRp2L2Yvvn2zf5m2F45MNdr2+zNQ05M8Mg/3dA46ZaXuw4caeLp?=
 =?us-ascii?Q?JGUGahz/fRW1kefl1kDluvutcQ6S4sgRIcpIIdZt1XxWPSFO4AVk0iAjprmH?=
 =?us-ascii?Q?IGTuhUNYIdqg77H1I3DC4ZL/RO/Qz9aG7CgW8n2deIUjmQXXgk0epU34xZnF?=
 =?us-ascii?Q?ljiuHfnC1ky8DZWXP/y7C7kQpA7qTHY7TYStQxIbLmglLB+k98w7BBNsjpP3?=
 =?us-ascii?Q?zjmzR3bI0fV4RiBZV7rTalsZClclhEmBreAIeXCHAw+j2ECF790w8jNlgJc6?=
 =?us-ascii?Q?kPJ9C+y52QKfv+YgKPkCFhHWT9NUL6e5GziH11NOK67KzU7GirYMwsSH128g?=
 =?us-ascii?Q?F+kyJ1MS9itOZ6I6Ze5xhkOS9WNYs2Abf7hDmZs+NgjjjP73f8ubeZRHzGo4?=
 =?us-ascii?Q?v9psvLUCtYISeApnJ9TNj8VZuCYA5UiP6Q0d2y3IIBUyFub8jcfr/6LShxxs?=
 =?us-ascii?Q?DW5/X6tYh4wcgba9Duh5WuiMjS/fmaQ9xxCrIxYq1da4M5ulIW2c5rowmdxs?=
 =?us-ascii?Q?V02RgcPVQ8ID06hKjddR1RqtlGL7SsdqGcJG3A7idcfaXT0YjgSY9gqAXymU?=
 =?us-ascii?Q?ankLLrgoDrkzWyYxoO+KQcRLMFccFyUE3qKfZMTCxPP2T67/CIZrnYR7EWEj?=
 =?us-ascii?Q?SI3VoYwg5XBNxZ2FiasGs64UVxdhcVKlC4aFrYgpP+fP+d09CeV2e3iEGDMT?=
 =?us-ascii?Q?/O9ytSGrvvYEE9mnuhvKsQxxlYmKQKUt8r4y+R2vKoawwuINZ0BJ19VuY8DH?=
 =?us-ascii?Q?lWo8Tfa4jwOU7PhNHrVFDz1IX2iuHxEFaAkZeRBX9gbOzUmjHHDlEXjIRv1P?=
 =?us-ascii?Q?Zemj+9vAokEVVXCix01egDorh9Rd2e0aj4LUVQZENAVcJtS3m1Ds8QeGRlMU?=
 =?us-ascii?Q?2RWUBBaxAZIQ5689AxVpTtNGPGAwafl5+GOAt3p1wijZ3bpTAnZljNOQo1Ni?=
 =?us-ascii?Q?V1zPuqWhBivtFJ7fq0RUQiFm+uA5N5/d7xEeHuASc6IADAmIQcw1DViMG5KR?=
 =?us-ascii?Q?sBcMnnPZvWLUzutfOic6b0pSC7aNfBvdxbqEfGgRIvmAebPYWmp87AWtASSW?=
 =?us-ascii?Q?ZKC/wGTdH5vwQp7G/RxuobmI2VpWG5zdeWXujnQfFiH0aOLzGHNdIFf7rpjh?=
 =?us-ascii?Q?I/VBdMKnbcRhvfSy/igR2RqZj2u8LGxy32JSJ++CZpn6HQL+pYCWPtcr+W1L?=
 =?us-ascii?Q?q4ox715bWDMv3qNkAF6kamJNwrHluFxOWXNJTpeVaUpv6JM6Q4HFfHeSQoKC?=
 =?us-ascii?Q?ArsOqps8bQgTW6Ep8TAVZl140IdX3gINfDGRX3sMA8q0YZhT7lx3laBsMQfn?=
 =?us-ascii?Q?bj8P6LUbl5vBcbSpW6CL83mmhOn5uNRwT5MMVsMYxfZoBZk+35bv1YSUpgdZ?=
 =?us-ascii?Q?5n5VECA8MRS30oSddf42H6kZOoTdTtfj3Ick18sQpODIVXNvutwxpo+u0s5l?=
 =?us-ascii?Q?R32sWOdxP9UH0xhshqHTSZeshGqjAO0dlPahkU66/OejaVKV?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 97502729-63bd-4f39-a7e8-08df14222d49
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 18:41:53.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGJ31hsuJBR06MA37bHvt4qbdgdrsCxi6PbEKo1ZgZaycVZj9xSGkvC/wfhkP/8V9khVPoY86Tr9F6U8N7Itcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5236

Use the span of `Index` for generated identifiers, so diagnostics can point
to the span of the index.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Follow up to also improve the diagnostics for tuple structs.
---
 rust/pin-init/internal/src/util.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index ed2c78f0658f..0b5c28b21091 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -41,7 +41,7 @@ impl MemberExt for Member {
     fn as_ident(&self) -> Ident {
         match self {
             Member::Named(ident) => ident.clone(),
-            Member::Unnamed(Index { index, .. }) => format_ident!("_{index}"),
+            Member::Unnamed(Index { index, span }) => format_ident!("_{index}", span = *span),
         }
     }
 

base-commit: 3b3ff9034a497fb3b8429f6fe8ba5697bc7dcebd
prerequisite-patch-id: 84717125cba2ef134e74459d283b3206649b3b03
prerequisite-patch-id: 9f34c2d1fc9699479209cd0c98ec43a70dca8747
prerequisite-patch-id: 830ff446f1ac103336c3b30c9914e9a22c70e577
-- 
2.54.0

