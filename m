Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD026ED41;
	Sat, 14 Mar 2026 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450427; cv=fail; b=bh1F3Zo16Q61eOHghxBc/enemfS68blNJZTRGNRZ+O0RcfFXxoPrMjS/leD7WrkoizlWyOTPrB41CFB3ncfCNhbT6d9osRRB5vuv4NJZML0ZilKj3A61LyPGGh4zByYE+UTfoL61CRmdYgngQ5Hm5y+BA16an4KnpR6696kAyEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450427; c=relaxed/simple;
	bh=jUS+WDEdkb7fBsUt+aWytxaHsjIvbx91v8Avu+9st3I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K9rvAOpUJW/wZwluSsfKr3phph1PWzznc3OfXTm+HbiY3lEBRAFczKkZ8Vcj/CdPu2/h3Xma838BTu8tiE0xTFGExpZb9fcU/CJvh4jP14827vTNm+p5MN+3aKa6KlEOkco5tvoVmXtrnd2Mr5BLtKaRnrbrjXSHdgZUyEM4MQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cQeY/J4Y; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cQeY/J4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEWp//FmV5e2Ts0QE1ZEtoaSJlhofMxjH5YI+9jG9NQkTiywRh7zhaa09CJ57W8V1GzMc4c5rGxJSmpsMyiUMFs/MX+8cpCzt2uqDD/4UEtm1I3C82zpasMtpnkt62cjVWnPYZed+uBAgU/FOoCHJcrdxaFwk7fHDcXbjEhcKoanPDlNPozDrodK2uzfb73cUjBsQ6ldqjo7vglbYst2sKwa1xWdxcxBnDZAJVXyIjMXpjAHvFw0tQY2z+xDaqv7XbzL2+6Vu9gIj0FTDnhK8uPEukZ6Hvvi6s/zY/OeUsaXbBWCLrANvZsgLwWfRWoQ92Zqq26yZyyA4pAl5y3LiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCGv0Tnx5fvu6KFdHYc6naQ3oJiYODv2NfTXktgt6/Q=;
 b=KkTK1NHX6VGfQyg44BLrKJO0t8d/Kw1c7U4+TeY7WMzFgf+LRFibrnesgkSNwzCeCllriaEJPCJRTdAsKR6hCmORs+QPJD924BY8f1GE+1RYEoWQ7CNcoyRqhnVsjp377lSkamnVQGv5XgzmgF3EJG7S71Izo7UiHOYs+Aixs8FGqNeNUxGtKiPZiQv02izvKJL2G1DsMCuu3K9iDMCkw0xblXWTwDujVCAka98r6h/NNly4BmWOJZdBSrGInLljokozIDPacLcqD3GFi/ttAOE91tbpCO5vp+PvqX07wexpigzP6+nMLkOyJ2Ft6GIG7JZFRxgrBOdDnYoUcMsn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCGv0Tnx5fvu6KFdHYc6naQ3oJiYODv2NfTXktgt6/Q=;
 b=cQeY/J4YLIsa2GyOqLjKIicrFkwF4iS2z77oE7tfBuYpNmyTamIMaq+U8mAgOtaMQjiR6r8A03HZgLsiMrOQL0YN8tKMOqF3RXMrflkjXZ9SENyYK2xWhm5+u694TZFC0x1a9fJVi6mT7e9NhnBQeoUpfWXiyJ1NxYoepjqEbhjGS9sMxLwKIMJ6dPaTCegWl725lbZ749tR9H2dQW23q2tLQMFQ1n9J/Is9NyRNAHyJ56HvlZWxbdMF84npJymK5NZF2xzin4+bc/Dl2cb9Gky88OiUuaALQ8WU8jPeY+zYHkO9MW03h0kaEkwaFvIHD4D33+yOQeNcURmSXrMupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:18 +0900
Subject: [PATCH v9 08/10] rust: io: introduce `write_reg` and
 `LocatedRegister`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-8-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ca1dbd-bd82-499e-6ba6-08de8165fe36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7dTbP9NNzCG8zeB4ixvYzCcDHV136ih8b512hyjn974anH264cbFNy3kP+uXg6CaDm0d/kMhL+GHei+OSM4SzqneLg0JaQCdFhpVEog4S+3+2fjXe9YfmtPz7saCvWOD5aU2cY+lNFWc1ym3f1l1kHowzzFfPMi0RSXRBQYEoc7GXufMlKdOkcP6nKqFgQf4Tw+Uk8O4fnUYiT8aLVCQVtSl0XvwMuedAIyzDAFLpnGYW8idq/ftfjWHe8VQFuvsOLKc1swPwiyqwhALDg3qYDJTJAqLJ41PAj+EAYEDpbsx2rW2apgzRbVu1TOz88KhBfM0gBEWl1osx03D3frvVN5X1RAT+3TmEqHvwrFJlot04s2ZWPC0iR6xmWrieRVTCnonqaKL3U70JRZdwLruXKRJpg0zwREDsqsc3gFdq/wpPUsWBSSJJ+WlTjLarm6zRzmGHZG9UY+f5KD95S+llLxdeMzfJ1Hf+DvDXIDFO0+iUSSltVavf4OCF5cHrl0QdxqAAX0UHlhAEdcrIdUTrDasWHHT7C+gr4mXxHExblAkuLdlc+jR7s0DdfZudeVIMKLGFo3BUurMPn3J7It0Loq7N/9q5i/8l5YAFQ6WDww5JyK44WFayR5y+kIVuWQ6xXCjGst6KHQs3tCODBvqJ+RbmAeweuzwFbrQU+OuIPKGMaAOC6f4FfiaAbOUCnXx/WZrfGoxdvvRc4OaMsfRff5tilq3+yNIAhX+t2YU5MYZV/lrfcKughZKpKWob0dpUTq4Vd8Qyk+JvQTGDvvp+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9zM1dpNEdxTTZZZDBQYWp0blgzUjFaWFBmZkNGWi9JRmw2NlMvcmhrS0Jx?=
 =?utf-8?B?VHFSYlFzMHUxakhzaTZpKzEwQmJ6R0tibFQ3YmhqSFJkRDYwWWk5Z09Xb2Fl?=
 =?utf-8?B?azAyU21PY0V0MzRYSTYrUXNxUDlsc3kyREgyei9MMUVZYTRUejVHT3p0T3JI?=
 =?utf-8?B?SDlJckZncGx3N1g4K3VoVUU4Z3dBNE9USmQ2cFZzQk1zaVpxem1YMlYvNXpT?=
 =?utf-8?B?TWpOMGZXbVpvejdOVU5FblRBRjQwYzY0VkdJMnpMazRRUFBVZEFBV2FXTXla?=
 =?utf-8?B?eHdlSW9IOHdEc0pZRmovaU1yRzg4cGVyZUxiSHdjVGRjcStZUEZUS0lOQjdK?=
 =?utf-8?B?ck1MT1o0ZDZJNloxTEF5VWgvbEhKQjU5RFliMlZiRlB3dWNCUWxiWjk0NWYr?=
 =?utf-8?B?U3NCTllsSjNMNzA0UkJQNzZGVUJiOGprQUdWV3dWdmIwV0hHRkJVajNYaFFk?=
 =?utf-8?B?cnUzMXo3SzlXelA4QUtYYkRrclBCWWhTMzZMdGR6akkyQTU4WEUyT09vYWxh?=
 =?utf-8?B?Qk5yWVFobUtjM3I5YS9ZMnBGOEM3QS9rRDZiTmFLVzRTQzlpVjlueGhjRVkz?=
 =?utf-8?B?YmdDeDZpVEFldC9DWW9GMDhJQjQwcU1ROVRkSW84QTFpOWJudURzaTJwSGY3?=
 =?utf-8?B?QlVWMXFYVE9sdmhSdEdzNzFsYk5WdDBOTzRVL0owdDk1MlIwajRqemcvUUtJ?=
 =?utf-8?B?SUo5R2hESVZtbHFxbTBjODUvUUpzR1U2RlhvUWRncHVmUkNsWmtUeXNMS2xz?=
 =?utf-8?B?UGFsT2hoZ2J4NEZyNjJNckcwalZ3S0FsbW14NVBDMDl1QWc3YmJHK0FnYUNI?=
 =?utf-8?B?akt2S2YwbzFwSnJlZHQ3R1MxUE4xdEM5SVMvWFVCS2gxYkdRUVpucFd2U25j?=
 =?utf-8?B?aVY0NmNFRHVFVCtoYTd6c1p3K0ZYR05NMjdRamM3RThRRXMyTlo2TTZYcWk2?=
 =?utf-8?B?QWpHNGNianU2WFBub3dMbDIrbk1vM0l5cGJLTjVvZkNGMGxTWldDQW5PbWw5?=
 =?utf-8?B?MGZpbWRqbWlidVJpQVhPOTZHOGdMUG1vd2dqUlFaME5jeXFSekpUSmhGTFF1?=
 =?utf-8?B?MTNZaW5aQTVXbUtvK29lbmhlM3h5M1hFV05wVlo5QThMcS8zc0RVOW81R29J?=
 =?utf-8?B?TmY1cDNScWxoR0p6c0Rld3JDMjE2NEU4YUpGSTVVYUxSMGdMcm11SlJtcEs1?=
 =?utf-8?B?VXhUUDhNM3JHekNIcFoxOW5kQ0p1NHFwZEtNb2VuS3Q5NVI5NHNRSWZBVE1j?=
 =?utf-8?B?citiNjF5YlMwT1FmVERMR05aNlBNOEdlb0pUYVRKV0xlWUpFMitCRUk1Q0RL?=
 =?utf-8?B?a1MvU1NHbWdDYzA1d3dKK2FTQVJ5enBwazdvWm16S0lRVDNtb0V5RVNyRWwz?=
 =?utf-8?B?SUVySWpqbVlGNllLRzRUZERCQUUvN2pRVFNOcCt1cGFSK0xaRVpQV21wNkow?=
 =?utf-8?B?U2FiUjI1d3gwQVA1ZCtiTFJ5bEY5WE94dU9jcWlZOTVaOFBlQTQyWE5VMTBC?=
 =?utf-8?B?M1J5L3dobFVpUnlqQVhIbXNQMUlPZkd1WWsxTWtNWjE2bWFvOGNGZ0p1WURV?=
 =?utf-8?B?RFhpaWs0OHJ2VEFQQ3dLV2VaUW1EZlk5UHhmRk02bnc1TGlINmoyNnRRNllM?=
 =?utf-8?B?dW9yclJTSVVIbnhEUGg1VXAwL3M3cy96dVdGNXMyWFVZTTBQZGE1aDlRVUxW?=
 =?utf-8?B?V2luWWc4cXM3cmh5TWU0Z3JENFFrWWNVRXdYaFYwTmxkcnYrN2xxZEdoMnB1?=
 =?utf-8?B?WUJFTHE2U0FUdE56YzRjclJSMzh3SHdnVTZPVm5NYTRMZVhsbm5valV6dmZP?=
 =?utf-8?B?OWdnMHFnajdwU2hNRHdMSXdPcmRkQWJJWnRHN3d1OVN3aXFlc2ZHRjdSTTNk?=
 =?utf-8?B?S2lsMUlRYmN4TkkzYmhocXZXbm5remJsLzRHcUloakYxd1dDQ2Y4Ny83Z3Ux?=
 =?utf-8?B?OW5UcGtJRTVyUDJKdG5GcFYwSUl2K2hQOUFZWGVuTWlxSEhHQkRhOWNLaE9K?=
 =?utf-8?B?eUczZnFaSU5NTmVnclMwajVZVWNCcTBUbW9xbStKN2IzakFiSitwNlhNZkZK?=
 =?utf-8?B?bzFlL3RVb2kvQzBlSU12dTlWZGlSNkNodnpRaGhLT3AvNzM4cnk4WUt6U1JB?=
 =?utf-8?B?bCtNYnRZR25ZT3czeTEwRFhvalhuTDhQNmFLdzBtSldFb05aMXJrUVBmQmRT?=
 =?utf-8?B?dWdnNGRRNXJQRE91RFhIaFd1Sm0wNnpEZVlaRDhsR1lDVnN2VzVaeHJJaXlj?=
 =?utf-8?B?dTRyN2ZVNTFSSjlIbjM1ZERHR3dGYWRTdFl6V3RGdENxamJyZHdmcGpOalZJ?=
 =?utf-8?B?YWZUQlhaVVdHZ3V3bmoyZmRISlQvZHVoTDVqTzA5ZGVTVnFoeUUvWWY1Z3BL?=
 =?utf-8?Q?pZoZMv4B/FHjb/cuxYgtBHlnnTIAoxjEBCI8DC+gVOEC1?=
X-MS-Exchange-AntiSpam-MessageData-1: VTo2SMBubogYzQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ca1dbd-bd82-499e-6ba6-08de8165fe36
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:59.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1TQeqEVcIX787BEIOoSIRiVOtwhClOwbhlU/EOImFj+s1+ab15+WEVKCD1OHdCt9f+A7hrWQ/D16QpwH8Hh8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Some I/O types, like fixed address registers, carry their location
alongside their values. For these types, the regular `Io::write` method
can lead into repeating the location information twice: once to provide
the location itself, another time to build the value.

We are also considering supporting making all register values carry
their full location information for convenience and safety.

Add a new `Io::write_reg` method that takes a single argument
implementing `LocatedRegister`, a trait that decomposes implementors
into a `(location, value)` tuple. This allows write operations on fixed
offset registers to be done while specifying their name only once.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/io/register.rs | 35 +++++++++++++++++++++--
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index bfea30a9acdf..24e6b48b6582 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -17,6 +17,8 @@
 pub use crate::register;
 pub use resource::Resource;
 
+use register::LocatedRegister;
+
 /// Physical address type.
 ///
 /// This is a type alias to either `u32` or `u64` depending on the config option
@@ -473,6 +475,40 @@ fn try_write<T, L>(&self, location: L, value: T) -> Result
         Ok(())
     }
 
+    /// Generic fallible write of a fully-located register value.
+    ///
+    /// # Examples
+    ///
+    /// Tuples carrying a location and a value can be used with this method:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     register,
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// register! {
+    ///     FIFO_OUT(u32) @ 0x100 {}
+    /// }
+    ///
+    /// fn do_write_reg(io: &Mmio) -> Result {
+    ///     // `FIFO_OUT` provides us the location of the write operation.
+    ///     io.try_write_reg(FIFO_OUT::from(10))
+    /// }
+    /// ```
+    #[inline(always)]
+    fn try_write_reg<T, L, V>(&self, value: V) -> Result
+    where
+        L: IoLoc<T>,
+        V: LocatedRegister<Location = L, Value = T>,
+        Self: IoCapable<L::IoType>,
+    {
+        let (location, value) = value.into_io_op();
+
+        self.try_write(location, value)
+    }
+
     /// Generic fallible update with runtime bounds check.
     ///
     /// Note: this does not perform any synchronization. The caller is responsible for ensuring
@@ -578,6 +614,40 @@ fn write<T, L>(&self, location: L, value: T)
         unsafe { self.io_write(io_value, address) }
     }
 
+    /// Generic infallible write of a fully-located register value.
+    ///
+    /// # Examples
+    ///
+    /// Tuples carrying a location and a value can be used with this method:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     register,
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// register! {
+    ///     FIFO_OUT(u32) @ 0x100 {}
+    /// }
+    ///
+    /// fn do_write_reg(io: &Mmio<0x1000>) {
+    ///     // `FIFO_OUT` provides us the location of the write operation.
+    ///     io.write_reg(FIFO_OUT::from(10));
+    /// }
+    /// ```
+    #[inline(always)]
+    fn write_reg<T, L, V>(&self, value: V)
+    where
+        L: IoLoc<T>,
+        V: LocatedRegister<Location = L, Value = T>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let (location, value) = value.into_io_op();
+
+        self.write(location, value)
+    }
+
     /// Generic infallible update with compile-time bounds check.
     ///
     /// Note: this does not perform any synchronization. The caller is responsible for ensuring
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index 40085953c831..b26dc2400009 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -80,10 +80,10 @@
 //!     .with_const_minor_revision::<10>()
 //!     // Run-time value.
 //!     .with_vendor_id(obtain_vendor_id());
-//! io.write((), new_boot0);
+//! io.write_reg(new_boot0);
 //!
 //! // Or, build a new value from zero and write it:
-//! io.write((), BOOT_0::zeroed()
+//! io.write_reg(BOOT_0::zeroed()
 //!     .with_const_major_revision::<3>()
 //!     .with_const_minor_revision::<10>()
 //!     .with_vendor_id(obtain_vendor_id())
@@ -379,6 +379,34 @@ fn offset(self) -> usize {
     }
 }
 
+/// Trait implemented by items that contain both a register value and the absolute I/O location at
+/// which to write it.
+///
+/// Implementors can be used with [`Io::write_reg`](super::Io::write_reg).
+pub trait LocatedRegister {
+    /// Register value to write.
+    type Value: Register;
+    /// Full location information at which to write the value.
+    type Location: IoLoc<Self::Value>;
+
+    /// Consumes `self` and returns a `(location, value)` tuple describing a valid I/O write
+    /// operation.
+    fn into_io_op(self) -> (Self::Location, Self::Value);
+}
+
+impl<T> LocatedRegister for T
+where
+    T: FixedRegister,
+{
+    type Location = FixedRegisterLoc<Self::Value>;
+    type Value = T;
+
+    #[inline(always)]
+    fn into_io_op(self) -> (FixedRegisterLoc<T>, T) {
+        (FixedRegisterLoc::new(), self)
+    }
+}
+
 /// Defines a dedicated type for a register, including getter and setter methods for its fields and
 /// methods to read and write it from an [`Io`](kernel::io::Io) region.
 ///
@@ -433,6 +461,9 @@ fn offset(self) -> usize {
 /// // The location of fixed offset registers is already contained in their type. Thus, the
 /// // `location` argument of `Io::write` is technically redundant and can be replaced by `()`.
 /// io.write((), val2);
+///
+/// // Or, the single-argument `Io::write_reg` can be used.
+/// io.write_reg(val2);
 /// # }
 ///
 /// ```

-- 
2.53.0

