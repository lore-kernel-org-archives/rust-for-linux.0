Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2A3A6EE9;
	Mon,  9 Mar 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069270; cv=fail; b=XaAapnVtdV01nbPH9vhQPgJKdUG3EGqF12xqpxVxwTAIEsZPStaTit+PmNTpS6rRVBN3zCJV0MPC4kytgkETP9XwnhGZWw4hRui/Ejt7xs2kHMVliwVjKw7aRv1GNTn+BVFrVm9qCK2F5lxhhxdpu81ABDM027b6bpWJNhOJa1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069270; c=relaxed/simple;
	bh=TcC/0HgSiNIqEHyMERhzbunfuxnhABk0R6879fRIrvE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sjvErJ/NXU/T9fQqgZrHQg/gZlod0ccVGzPOqZ82h4yPGjUgbn2yEEow61444ybwlaTeuGYthJze9xcIU5uPHVYhAVzGEOVjamfWR080I6cTChYVdMLwqJOLeTXgxV/JeVAB4MtbWR8VEPlDk+Y4zahUziq3sloMUBG+MVff0i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rAixXmQ/; arc=fail smtp.client-ip=52.101.52.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAixXmQ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izUgcWWa/7aL5IE33bHVk5h42+RhZYOK4F3eQzcqzAZfe7KCyf3MOVVpXYFbj7kEgDEmTftGs2LAvrTHgmtIRtI+l2vfs8QuaQqLVcM1pk0lYfuL/cspmj3z1nOhCzp45a0kA7Sk7UOsWEAc1/1uEQcxO6RDdsn1Nk/od9ccgRfC6tKTPILeqbUjU5SXdekyFIUaJ63dtorvbeZaEhQr3CMxbrwjJLbE97ilQ0jk7qJcDzs8m5wZ6t6bo0VMw7fAHriEphHINzZMBfPm/66Ku7Vc0yDW9Y9ey0uLO82YbbhybWEqRA++2f2PSsRShjmiciLpBfigzRhmJKKtvMVcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSznYsY1ajD8r+TxMVK8h1CuRPjgUYV87ErETI4erGs=;
 b=l3nY4Nqw0t07BBojx2OsyZzKFG+Bgwr+sCwXJjzGaWc1o3jtofJ2Evc7syzTdtN6GlXlEUDQ2v1EmR6lm4nNkSAadQsz0NJmo1i6rOshFkEzWAMCDqQp/pBTTLxzWnZ/E0ta62K+D143p+rmLBouh5ENxECqhx3cc836NKol5W7uTG8Hrdk9UPhjGCnCSTpkppkKDE60WvWKp2Bnt3qeZguXj4IEiy2qB/LH0zky69G1eywtBeDgMJe7CKJ6kqRY8B0cmNvlMGn0tKT34w6oc2+iYYdvEQuheczDlw7faoe6srkumj/LdBbRCZNUtBnV+5ERSJruanVEeSQ5RVGAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSznYsY1ajD8r+TxMVK8h1CuRPjgUYV87ErETI4erGs=;
 b=rAixXmQ/gDq5a+RM9I1a36vStOVi9WB5msP7z4f+NW7mqbRH4wYHfr4mRmO9MF4fdAYHwtRSgodNJkqmfbMQTSudji8gGXM6osYLwZR3PC5VPFf1YR231fYndQEdboqhG/PaNthllgZYJ2wy/jMX4mMR0bkYyp80a/D9J0OZgTugtVaQBZQ6zIRenSOv54FrCFatPFnSxPHjhOLbNY5I1/BWsYuCJxlZrTsN/RLnV/GEIprxLqc+EgKW7UEDUqznBi05f8tvIqJ79s72bDibIIoMlJbQeJhjpRk0XvLvngx3UzI0RL7dck2bQUlAh/LEGOXevHrAXQqfsfolMDmA4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:13:59 +0900
Subject: [PATCH v8 02/10] rust: num: add `shr` and `shl` methods to
 `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-2-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0119.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 146433e4-ed97-474f-1841-08de7dee8b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	J09Cz2YYTkxH/MkeP9WQV1YFV03b2Sj8iaVA1ovW0+/38gouCJYZ9BdRaTz4c9eI/NMHzki/8+XObBw7s+qxgmjS3ZRjI0JdwUwmfCxVSQqUb04uwSHQNh7nGm1/t6aIXxSZzZW0oUogsoRTEIXjsAXzT2jr89qjzu8APKtXE13ocsN/RQRHvqOY+tDFeNcg3JR9TuCPU6+/IsJ5C3Uxc3QWva2qURMbXOCecPEepdROXLY/YvsJH9SgHvIguOmIx1r4h2oV0/ZXUwHzhO2SZ9TibffWpfQvoKOl2LfPKKLFWEvoQmHJD619/mSRI0xjv7QaR5OlR8p1lfxQOnyB3gTPVKp91ivy0aEeH5ggglqe5pzM34h0x4vjfP0O+CqmMfkbq7O9V/WCz1TdPAl7hU3xVzMXgzfH8MKQwe7Y+VJQE3MJ/ZtLApJijtYWXAPB/RgB/toKwtbQ+h4pQ0mDUMwye1Uienrxwh8jzqmBvPZKLHm2Crzhr8Gm8TdByRX8K8nhiwbLlGlrH2AGDdqimk7jmZ95pfyeG6FJdhX49H5vu/frRpq3JgrQF4k8YMVvdad0jI58j+J+YhSZ9AGOMkVWgiAqLPrSCupX0lcbzPbOJOT5MUzh9q1Cj5Hxa8SkCGjL0RY1xtz4XfdBWd0albIY6ehtZm42s4jlM4GXO8JjgemolnNFqAwRZZAFh6TwSLRp9GM/SRdpaFpR9kEF4NFLqGjJODYf/5pLFlJqW82tJoGIM2QrTnAeXiYZHYORInqUqzDQ4/FgEx7wr9N/MA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdUdlVseXliMnJDVis3WjNVZ0RJQVhBRHJVTS9UM2RidEo0Tkt6c1BibDJZ?=
 =?utf-8?B?N0F4SjRDbThkT0tVRzNZNCtzcHVoZGpPT2IyQ1lPZzZRQ1BTMHMyeUkvZ2dv?=
 =?utf-8?B?S3cwYlFQSFlNT0RaSURZNGIwSnNwMUhieWVPeWUzaWxDcGJpallrcXI0Qmp1?=
 =?utf-8?B?WkpKOVM1ejMzVDhpNE5lQlJNbjk4REdxUWlWbzFTWjZxMFdab2dpSDhhT2l1?=
 =?utf-8?B?TEVNbllzY3htcGtQWVU2UGxLMkJBbzlnam1JZHU2NUZiODRwdEVCUHNTbmFG?=
 =?utf-8?B?RW9teHQrSVNnRWdQK1Bpc2h3Q2pTRHdOdUFKUzRwVkY0cm9lTkF1T0hzR1Jr?=
 =?utf-8?B?UVdkUDlJRlhrSmR2QXZwS29tbS9TMWVIZFlERFpveWFyOUxGKzFkUG85WVRD?=
 =?utf-8?B?cXZiUm9JUmh5cVRSbThaUXRTTWJjakRxQ3VQN2hvbEpSVzJqWkNLREVMdUZU?=
 =?utf-8?B?MVFaVDFUenpHcFRWMzAwMUZ6VmtxcDNEZml4R2ZzQnVpRTdLUnIvb3hWcnkv?=
 =?utf-8?B?ZExJWmN5THo3QnpEZ0FIMUhsaFZiZjhTd2I0c3BwdzBUQkphR3hvSDNZVmVT?=
 =?utf-8?B?a3YxVXRIMm1yWmx0MEhnTHNiYVQ3T1RYL00xUXY1QitLZ3E5L010RjRYdEJB?=
 =?utf-8?B?TkljUHl2ajlJcHJDamhiaU55K28xaTczN1dFM0JCU2h1VlBqOGtqNG1aV1JF?=
 =?utf-8?B?bDU4ZjI4dytFZXB1Q08xdFhIREhJbzU0UkNBckpQWU42dThBTFJ3eE5YejZ5?=
 =?utf-8?B?MkNlM0pSZkMwT0dIOTlINVcycnMxSVEzR3FlM0JpSVV5WHdqS3NsRS94Ynha?=
 =?utf-8?B?djJjalBMTFlKOS9UN2NtQmhXZldhNmRnWGV4c09uT2JWTWpuRnI5MTUwV3dB?=
 =?utf-8?B?ZU1BcjVMSjFNL251UTFrSWhKV2RoR01LbCtMZGJ6R284Tk5LVEp1OEVIcCts?=
 =?utf-8?B?ckFqOXlWM1NIL2xzNkVEaE5hZ09OMjZrODcvQzhPNmthSGhqVHhtWTlDWDdL?=
 =?utf-8?B?d3k1b0J3VWdEYkRUbVdHc3Y1Ymt1SGVXblRqMFBEQ2FNSHl4MHdkZWg2SGFY?=
 =?utf-8?B?SklBaVhuUFJaVSs0NHJNeCtvSDlXNzZoUU9GeWx4UTUzSHN6ZFlsa1I4M1NC?=
 =?utf-8?B?NmlFNkpnbE1SNEltMEc4bWp1cGZWMFVKMjVsQ01uOGRENVhBWjlDYXdOY3VT?=
 =?utf-8?B?Mnc3ak5ST3NKQUt6cFdzQXAvelN2TTdaWWFSeDRxZVViVWhYVEQyZzlyTGI1?=
 =?utf-8?B?SVFNckVmRWFKMWd1QjlIcmdQZWFBUkRJMHZVUXQ2ZDgyMlZVZDh2bXFJK2Rz?=
 =?utf-8?B?RUlQdFRxVUVzMlFMUkIxTGdsN1EzbkNrSCsyTXRGY21obFNrMUhCSnVDb09K?=
 =?utf-8?B?L1B3MkNmVzBtcEVKb3N0dzBnUzVMNlVHRnNjdE5VQXJ6RGt3cDAzNVNtenRK?=
 =?utf-8?B?N0FHUDFXVDZJcE1EVjNIT0F6bnhDQjl6cU9HUXdHS0tCR0s2K0ZtZG9Qem5U?=
 =?utf-8?B?dVQ2ZGZHTVZvOG5XcEkxWW9KZFYvVXo3RG9aVUMxaXk5WUlBTEtmbktFT1Jz?=
 =?utf-8?B?eFBJNEpKOTYvSVpzYjl5YmpGckVROG42NnhpUGR1Nitwem9qY2lhY0tMS1lJ?=
 =?utf-8?B?ZXU2TGlXTElGZFlYOGlLM2l0SFh0TS9yWU9UVldlSlQwT1BRalpYUmo0SmUx?=
 =?utf-8?B?R28zZDN4bXlCWmcvQU9SRkkySjBFTkVRcm5uaFNwdm45ZXRuZ054eFV5bGd6?=
 =?utf-8?B?K1hKWXBCaUdIdUZaRXZ6UytaSjl4Tm1KU3oxZ2ZiQ1EwRGdEVFQ2L3JoQ2xS?=
 =?utf-8?B?ZWlxTkE0amNoU2pWOUk2NitEWS9JV1hEYXRXMWJiZk83eE1oSTVCMm1URW1Y?=
 =?utf-8?B?eVpER2xHdmE5cXRib2d0bkhOWTRwNDU2OXV5LzNwTTVJcmpZLzgzRjN1UHUy?=
 =?utf-8?B?QWkzclkzK2llRktlRDY0WE1qL3lkcEUyV1d1NXl3SlhXRmswRGtsamxFMmQy?=
 =?utf-8?B?YXlyVUJUUEpSSVM2cG90ck5mVFNmVFh6MnhTWk1oYndES3dwVW5uRC9vQUhS?=
 =?utf-8?B?YkZLMVl5QU1yNmF2aFFpNkdDZHZmMi92Ny9HN21UdWNvVWVJbDRacGpkMHph?=
 =?utf-8?B?M2dmKzBTY2JzVTBMUjAranVqaGt3dW5TZks2eUVaaWIxNlQ0THR0eTRkVVdi?=
 =?utf-8?B?b3NCSkgwa0FnWDNMYm5LY3JHTStaOVFGb3o4TUtXZ3RTQWJTRThTSWVZRGx3?=
 =?utf-8?B?WEFxajR0ZndjOGlzYzViYUVvWXZhKzdKU1F0bXlhbHFucGx4TUg1eWcrd1RD?=
 =?utf-8?B?WjY1bzE4NkgwZHpFdGNuQWxsMUQzTjZHcTZSL3VXNERMd3NlVmUvbEJwYzcw?=
 =?utf-8?Q?RqlkThu7MG6HbbLYtuWopfexecgO5oi+0oAIqJCKQmZND?=
X-MS-Exchange-AntiSpam-MessageData-1: I42rsHBwPgYYbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146433e4-ed97-474f-1841-08de7dee8b1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:22.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUQDKhUGaV2UTxJ9sAE+zK/xYJU4oIrjAv2EpVvslFN8QGEFWGGUAC1Ft9ZOKqYKuSBE8znTH8tIcUELqzqHHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..2f5f13ecd3d6 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES + SHIFT >= N) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.53.0

