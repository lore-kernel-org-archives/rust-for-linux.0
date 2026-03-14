Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA82550D5;
	Sat, 14 Mar 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450404; cv=fail; b=DQQgFfrktFdVTP4P02oj+InxxgFYYAEgs44KWenVn5Y7WZn4+aTUGYOsZllTIdViVoIsodcR6kyASwB1OxmEJ+2qZDNOfWbzAEufc1TdUKnmQmY4AvllDaZEVBnC9Vli3cW/RsQkk3zYeHOckaVoJD3XQkhRgaY8eceILZpfN8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450404; c=relaxed/simple;
	bh=Uam97JT0Ehkz6x3YfVS2uBfORH+d7sDDZqDf3SfLJzs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bkQiGWUg2VY6E6ZEI2HFyBsUhmhEYGhiM0z4l27URaM++zwIk8U9Tq/OyOG2stO5TdhiO2Jo5GaLawRVVmTHJooG5ghwlhdxNrfJXZ3EZSn9wM9eSX2PuUXzDVtrA3uncBN1zW2ix6xheYtfi/iQKIDJQOWgf7tFVPjB1SNQa0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tEvo7zxs; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tEvo7zxs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R71rF5qex2bd7+dEjWme6UGubxzzdZGtbEKW7UBAI7J8omYSQo5dmhRS4OWNuDstvSme+mOu1/EpYapcjtt7EawoFmzoHF0reYJ7tO1m/48w4ecU7yahjzJqOzVf53I9rtqTd5FL50WMuOSqRVcBdWPqnIvYo1oXnFpEViPSgVSG3oZQZ07H662lJnbRdVh19J2kSMoC7DYVdzT6LlJGgY+2X0L99ZH8QghRe51fxM44g/RJNPD9Lg7LkncAHdtdMGzuOtJHGF74OQEPLKDyJMF0nKGh1iHPXhn0jTCfJlIx12nxNFwEkC3ZX9izOp6gJxsuHJL8JtkwVzFK6yUZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi+lYxjp8u893uwLtsJsUKUul8Qe5SJoOXAXtyxndjo=;
 b=hDg36rZS10M+sSPltvZfDw9BBnb9WK562xabk11KtGRy/7xgol+hxMvZE0IMREla2UDMBAJOlQXCrHBcgGLlJ+GNYMKjI8B4YJCin0vYPSs+tBOd7Ao9S6XzPFMDTqSxxD8IXKmQRGI6PP/fKqvEEVMDeHWPasCaGiic822cREAaYPyda6zzCGCBn0T2XfukwQGbvSYjheknB8ryIxbiqeEmv+jDo89Ol1AoLJRc1MLrMj5SK4NCMCo7Ienf14Wlrn3KZuMu90VZGiNGWJ73PuelRbP4wt/9HgGC09lkFlr8SRzhOOa1lh6hdD1CXvssi5oWKRnoTaObccYAl0nA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi+lYxjp8u893uwLtsJsUKUul8Qe5SJoOXAXtyxndjo=;
 b=tEvo7zxsUw+XkR+flKdqKaRaMT1KgGxN4fjspvi5hvDt5itFFuNVpml8XxteCY+9mbph1SIZ4g4a/TBCjhsaKk3/zTiW3VhwBPy7pPxhTP9VscakcFc/GJ8ARC5FkhslDzwX4UTm/kq8SpNYVHUgL0ChX1xJEQ0VpQfIilcpZ5i5HaYdVeGk5lXk5TWoY9652lmH0yhjxJ1na7vgF9Nigax/RAgq9/Hpm0ZlV1pE9L7xuDjjR6SxXwTwfGDNO7fk0oyYlrOzdIlA3nLjaO+9lMkqcw4mknh71uALly/PKKSzSRpomTisXvbU1jzRrYKccy6XqwZeFq8Cg3v1Om87vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:13 +0900
Subject: [PATCH v9 03/10] rust: num: add `into_bool` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-3-86805b2f7e9d@nvidia.com>
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
X-ClientProxiedBy: TYXPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:403:a::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e454ff1-a197-4e55-1224-08de8165f282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7d6C/3oaaGoyAMrvPYbClfzQ+oIcn7zifZNvFAZFhgfy0OsagMrQz29XyZJSSD1rBgum+UylJyNPyR88L5XZJK9Bd1WorzoDZtjqL+JYomZ2vGvNVjeNGw6vNGKzbCdpfvRJGdFuCGUgJY+raYRCLjgFX7wawjMcbs6BFM8gh5XRqkPZ1RXcIPYyQ6gVrbMCzG3kyTqwUgRdnwJtW8wKymTI470ETE8cYDoN+u4I9AFhoEm2BGQ1isFAwVAjGbHDoUeDO5RXopnL7drPHxRPV0hbrD1suA98hO/TZI2yz/39IAF2q3cNivSgRE3ZEADYiS/FQYuLQ0cCQ/oLOAO0BMYns9PTlwHun8lp6WR255JTBwXVvnaHsuP5Licygeyf2fC7ciduO8vFBpW8hgUYgkwXi6PGjVaxIbIlCcjZUgrWY/ZVigayujHt7FfNNvAciu91XrATkdVj1O5MwWYjFobiChcvfCeDw/Qf6KbStgOcWt2MKEo+armrqILDinqXp0OQ5jnzs+mZldShGi6aMUXGf1r00/X0dQs6Uln8v2Rcj6ya9R8yRUXE0K/QNWfEOzWGeh6xYMgS3Wgt9NhtHP5Pl8XW/GUnqVjwvhoS0Uqj6vUc/YJOTcBHiYyyRCjOfOAMtTfxTpFm1ZOhb3xs1HZPYabcG79YX77tjXPFYYHEtt6iov8v4IB5clbugstC21OysoW9OEatlvWKloMhAvn7vE1XljALXYZo9xcFjKVbrlIskoWIyfsYhf3s7bfgLsOZNDdLEL3Kr2o4WGRafw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3Jndlp4SEY2UkM4elhhVXBNczU5cDIvSnN0WkNYM011Q2JkN2ExOXFXQ1pD?=
 =?utf-8?B?bktwWGVKV3hJVDJxVE8rV2I1UmZBM3NtVnkwaVZpSENSdWVNR3l4cytlMjlT?=
 =?utf-8?B?QWdwQURpZkQ4TEpRbWRleGF2R3l5M0FtU2VXWlJqTEZvaDJMR1F1SCt1YmlW?=
 =?utf-8?B?WkExYUhyT2U1bzBoZDk0UGFEWW8rMHFmVUV6MnNSTHVuaVgvbW5XYVZIcFd4?=
 =?utf-8?B?U1hvUHE2cWRtKzNrZlMzYmkycGhzZVhFYzlXckU4aTZSejE3ZXd6cFcwZmJh?=
 =?utf-8?B?NHZIdHZnMXk3MDVyZU55eVp4dGxzY0VzdDBsbEJwd2RZL1JoTE5mei92UkFw?=
 =?utf-8?B?VEF4N2Y2N1JLUzJjRUpYMm8xT2ZKMnpvRW9BQll2bjU2clBaV2pnMTlzeURD?=
 =?utf-8?B?TkpBc1BVV0xCdXlKSXd3R29lSGxKR21DZ2hFaU92am5jS2JHSXhEdThJSEo2?=
 =?utf-8?B?QlRoYW83ckFiWUI0NFBQcDhQUENETCt0blJuek9kV3hwS1pCTUtDVGpKYy90?=
 =?utf-8?B?azUvRkgwdVE4eHE0aDJEOWdVZ3VyVDBXc0FDVXNzQXpELzNnSkIxVDNJazB2?=
 =?utf-8?B?dW1qOVJXamhsaUxmM0hIRzNmYSswcWpnNFh0aVhXRGhpWDRMTUFERkpVMVpQ?=
 =?utf-8?B?TWdBMzhsSktlWXRLcXhySHNEOC8wK0VqN3hHWC9hb2J1aDRXNkhkTlUzWWFz?=
 =?utf-8?B?b1I0YUthdFFmbFlKU0Yxbi9DRHFYTkhMN1NxKzZXSzNud2tnVXNYYUVma2o1?=
 =?utf-8?B?WVR2S1BsZHYvMTR0czJaK2VuZjExVEJEaTZVRG15RW5wcjJmdjJ5ZVdjY3Vw?=
 =?utf-8?B?VmZwWXBEV2tWeWZvRDJLREtNK1I0Q1RxQWoxb003cHRTUkFodExOR2pNUmJ0?=
 =?utf-8?B?WTRsMTc3Y0czT2pMYWY3V0NjdXhrQnhKcW5HWHlGN1Nxa2ZHSUJxMjgwY0dq?=
 =?utf-8?B?YU4yM290UDRDK0hYTFd0eXFENktHdlVoN3RHSGswWGdhZzl4LzFsYWo1U0pt?=
 =?utf-8?B?SmdjMjNtZ0V4M2xJUFc4YmlsRnBhUVFXTEg0c2huUlBQckdrTG02MU9SeVJ3?=
 =?utf-8?B?aUs2TVhxR2U3NGJYa2VWNURFWUs0SEhkVW1ZblVVbnVGbnRxMDE4TVRhTHIw?=
 =?utf-8?B?eENLejNHOTR2dVR3YTIxL2Q1M0NHYjBseG4zNGFhR2RNV0lIQ0FJeTh3Zlha?=
 =?utf-8?B?dUMzNlR6aUN5aVZJQ2FCQWtRQzVKcWNYSmNnTllyZEhZaGowVklRYU5yS0xv?=
 =?utf-8?B?d09BM0JlTEk2YnBKNHJJRTUyRUxpbmJrMG1aNTU5dG9vVE1DbFFja0dvZlFy?=
 =?utf-8?B?bjdqUkFLOUVFWnNlQkc4K1BUZkVQMDEwMHl0MURCZmozV0xzTm5uUEdxTkRR?=
 =?utf-8?B?R3FQY2grTlVsZFRtcWh4L3djemVrNkFHOFl0c21nVFJrR1AwTjlTZWJETDQ4?=
 =?utf-8?B?UUd3T0RUQ2hvakxrK0Z4U0ovZStnNWpCMWVwN2NvaWIvUFB4V05jdG8vYUh0?=
 =?utf-8?B?aEdDYUdMaEFqREpwYzJ4YWdneFBMM21yOG8zdzlXRFkxRzdNd1p0L2ExdFBG?=
 =?utf-8?B?TWNmMGFmamNiOTBsZWY4MTBEVG41bXFEczVXQ1dZWkU4bmFLZTVkS0hSQWpB?=
 =?utf-8?B?WDRKMHpTYSs4eUROeDBESGhrUUtteldwNEQ0RWllU1FXSVV3WDEvVFF3N3Qz?=
 =?utf-8?B?VzNPeHRhSnAwRjBUd0ZoNVlkZnppdk0yYVZxR2Rwa2dHQ1R5L2QwVm51WTRp?=
 =?utf-8?B?RGJ0cUxCUS9xMmU2TWU0cTU4RmtRT1JoT2xvRGdMa2E2czRpRXpOamUrT09u?=
 =?utf-8?B?UWQvWmU4bHRXVTN4SHBXbHRkNTlUaml3bmIxS1RJMkhVQ3ZSOVAwOEUveDFu?=
 =?utf-8?B?Ym4wK0xlYmd5bVlUT1d3eTlWR01tVUVvbmIxRzNiekxEcy9QQ2NzSWZWbmtt?=
 =?utf-8?B?MzdjRkpGYlN6TXI2WFFJZTBmdDdJMWpPaVp4cmN6WEhVL0pHc1JUUFE4TFlk?=
 =?utf-8?B?WmNwMFpZdWd3ZTNwUkZlbFhCMU9UOEVkci9TK3E2NzlrRjkvSFRjZnZSWVdZ?=
 =?utf-8?B?bE1JUTI3VERTdGdjT0tXQ2tnaU1pbFg5N2N3WlpHejJmTEk5NC9hNmZ4bXN5?=
 =?utf-8?B?RUdGN2FoMVgyc3Nqd2FFbm5NQ2hOeXhuU01uVEdvSTllZ3p5UnVjdENrRVlF?=
 =?utf-8?B?dFd4SFZSME5Cc1Ewbk96M3ZhYWY5MDNKM2Z5UitiQWF1WGRUZ0NGek9yZ2Fa?=
 =?utf-8?B?eFVBckYwbVU5UWNGR0wrV2VMOWhXU0hCY2o4bmdocTZBeTloQXMwYzF6Y28z?=
 =?utf-8?B?NjFxaS9Mc2JzVkVXYXJWbE9uMDFyOStMMTR5VWYwV3ZkMGpzdzN2M0F5bStH?=
 =?utf-8?Q?jAAkzhhjBTr83pyrgwulAUiHshU21h9wbjofpc1DelO1Y?=
X-MS-Exchange-AntiSpam-MessageData-1: og3o40KzCTSpUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e454ff1-a197-4e55-1224-08de8165f282
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:39.5061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bXF767dsDJ54qe9jnp0nptaWuV+jv01IxYAcEnZt83nkO3llOnjDPFF7zpWZ0dVhppaFJyIOH7a6gSS1JahGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `into_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 2f5f13ecd3d6..d28d118abd8e 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1101,3 +1101,24 @@ fn from(value: bool) -> Self {
         unsafe { Self::__new(T::from(value)) }
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Converts this [`Bounded`] into a [`bool`].
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().into_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().into_bool(), true);
+    /// ```
+    pub fn into_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.53.0

