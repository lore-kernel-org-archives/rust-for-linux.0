Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2653D7D97;
	Mon,  9 Mar 2026 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069271; cv=fail; b=cNY1qYQ5NzTp8nXkbVKIaE/u17j4fS5XlvbTqnFZvmtj2Rr/OV3uy1reSIjRTjR0oFKvRelmIekylecHMaUcwc0xreoBPekAyNohYWkvg/09q3gqH6vuuy8cy0qtkvxKThkatHobVhWvcW9Xrs1y0A4j4vRiSRD5mKC7byUw8ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069271; c=relaxed/simple;
	bh=g6pxC7YDKxn8dWDn1GgkniFa+rnZSH2UAw9aQPrd5WE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A4GS/SabxVxKK7aE88pE0nnKdzF6tXJKkIsS8oNvc6kBoeH+Nzu6OHHWBSDSFoBeKdX5dTpgfOdzvO4vH1ptEaA5yHA24BRvRh+vcMj4U4yXtOuzfYPtJvcHoxUSYSPz/MIQaF/kDaUSd5OwV6PF5f9cdOzYfQtnJ+qgURPM2X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YXVrZ4es; arc=fail smtp.client-ip=52.101.52.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YXVrZ4es"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxXRDIGgZK5YjwSdelaVozb7kXWIFPsqePabEIRZO8aLKsq/3oaBDeJ9OEvaPrDOnBmd1y0n7tORjAkjaw8L53pBmMykwP0XGpROqb5cPNg3ZGJdX8bmd+9B5wpcquMZpEXSnOoELmqivCaKcm/3Kgq3ADJNaLmdfdlGhXNmqTjCWnqNtvEd21RA+2ogWuCfsCm96eeK0c/xxJxMOZvlMIVXk3FAN/JHDwMu6jHHNUvmMSCkRJkrtZaTXn1+dXtLQ7IdAW2dTfE9fwUTTUAoIwz9JYFuYAQWpoiRMSTLYFGFD+oD3OkPpo0wzZkB6JxqArhBjxtHOMfAvWRh9esuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dnFWA9MUzwJOAGqB5UIX9vY/f4AMIt2w8I5b+B/Cx4=;
 b=e5dgqf9lQFchuCEaJE10eueMQzyiroGzGGzvgJw/nLlheOPKvaMAyDQrfdKOIbU5gfxp54lSTKQ9o3D1i8QM52fah9MdbcgL/y2RJQGndwQ1Py4yDffDhzZjWnrKPYrVxYBw72nDYE3IwlDwmPfqb/JwN+NbMdbOk1NLnjxIsalpXVwU3jcpaUflaggOnpD+xKdywMHHaQ7BIaXI7Nkb0M3agqDMICz1nCOuJPAjm79C+iJmOS9BdxS1TMMNRhqgi8Y7JeYhMfDhhkQG0Pq103kdAMg7Wq/OZXDp3UHLndqJx+QkKGlGcwKgIWUpxUz+jRnrR7zFCB4s+xoKaHwrKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dnFWA9MUzwJOAGqB5UIX9vY/f4AMIt2w8I5b+B/Cx4=;
 b=YXVrZ4esmBc76fngLZYAcdFHbRs1Sjtuw0YWnyn0PmP4UM75Ol/pftVz3N2n80e9OuTpVAwYpy9BFxoyJJ9GMITeqhqwlXXzpKRCrP2vrgQmlQagunK4BrgQu0FvGglKj3kO6DQjniBEVLsN5VRkmI6X0xSINvfJG9/1Rombdnwf3pizjCVNrFEQfvFUJBKyo6pTH73iURAMUyxTUh6TCzC9wE+9+bxjAiM3a1QaGgg23yqzMLhcSREopYfJOajRMIq/GWdqvhGKE5cE4mzl7B4IHwQFgHXioiiyOixkY9fRdyqDOPrC9xHIExEzgiF8cdv99FhoDpAciDdWK42hCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:00 +0900
Subject: [PATCH v8 03/10] rust: num: add `into_bool` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-3-424f80dd43bc@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: d148d91a-c6b4-4933-48ef-08de7dee8d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	ROMfP3uWz3IdmsVeHxBUVURas64YrLqBw/nE9TE+F208rIpNyhK9y9d0TOtku9Y+bFpiL6eNNoL/Gysi5IgpoLZBFzwFAk5cFHwFcjNJqdU97h9qbGrW4lqgv7fswfmxIzq3OqaFGldnTe3gu44vymA5QrDmRUjeM34To+IoMDOfGu43tOmcLHWUXsbaxbvUAUOfbXzeSf9kdedcm9oBpQcUxY4sktz8ue8UsBkMQOoZ1SlfzybGSilXQtlKblcrnmOG18Ae6PROVVR6uRUy8Y83Mjhd+DV3ZwMAgwRNA725v3o+9wqCnuAqFMrJbJaQ5unT5Sflzxxg+mpR+PNp43egoYYTDVpQ0zujs2U+3b89XN0S0VKq88goyR9EhVcTVDF98yoaJ2Q5Y7knBv68CDVCpkdXFcUEHAlZJiThsTuW3uKq36uQPmUC/X2k00WqJNJs2k4SA9Sa2WG84RqS3gfy0vpuQxVKS3m6+ufCae/bC1d+LWTalQ32ybEliQbnDD+j070FZ5z5jrPU97qKHtPcTntvfGIEVR7sFE3ESm7nI01hRPSzcmtr1EuSPKHSqubtFYP9qtAHkz52cA7C33vr+Hv1lse38lvSZ9prxc2wNX+B+ZlLeozZ5RVMsqLQEiyUwvPnNxnV6gZc8NaWA44oW//LVx5XHLQQnxQCc505pQ7f/jS1//iC70KK/2H1rlGTi1ksKig2wcDfEggf+aBn4iv5TUVQPo1I2GZ7LV3bpJgCHpEyRiqsw01USu2NKWrANXml1fY147uea5lFZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxBV2xrZ3hWNGNsakpMQ2NEUTh2V3J6QW1hM2pQaWFMUmp6L205MDU3M1Bv?=
 =?utf-8?B?aGlMWStrcU5nUzBWS3JuN2R3RDZ2ZGtmb1g1cjdLZGpHNVBkZWVPM0ZiRFRR?=
 =?utf-8?B?MEhoT3l2Y1llR0Z0YzJqaDM4a3YvaS9hdGRDcnNRSU1XRVloVVFWQlpTK2dm?=
 =?utf-8?B?WnY1NUZJSDArbnNKMVRrZmNxMzJ5QU81SGxPRWQ2eElla3N3MDNCRVMzZHp5?=
 =?utf-8?B?TitrQ3NMM0tSVlp1UGIvaXZvaE9ZUDNRNTF0TzZVTkF3T0craHZkd0xxVWN1?=
 =?utf-8?B?SDdRMFpFa2xnTjFQVEp5V2xUV0dmbFl4Q0hSN0VVKzl4dXFhSzBFeWU2RFdS?=
 =?utf-8?B?dVJYWkRxbFliOUdQVHlBdjRzQWhLMEZheVRRdFhzOUpvamFWYk5YZWFUQUpx?=
 =?utf-8?B?UG9DalE3aytvTDd4Z1g4VmxvK09ObURObENONWMyTFhRek9UZHJwWko1K1d1?=
 =?utf-8?B?THcwQW93RHdsbGJQcmpnTjNMd3V3ZEIzaEUzMnZ5UmN0aXVnOXJzbXVDam02?=
 =?utf-8?B?UWtzbVFWa1NIUTNsVnp3dEJ4ZDY5aEd5TXFCWkwwb3diV0RJMU4yc2NJdjl5?=
 =?utf-8?B?MFRzMDhzSHd5YVh0eXJXd0FkR240MDdiYnBBQm54TkNJcmM5aFQ1TDZqYlBE?=
 =?utf-8?B?RGR0TzdXNnFyOTRPeTdNMUV2NTZCVXhmTm1QSzB2SXB4WVVoVS9TK1JYWVFY?=
 =?utf-8?B?SWNvOGd6bEZSNXdYSkRmVkpYOU5wTm1uNmIwZUZMbWYyQTFFZnRkaEJEWHBR?=
 =?utf-8?B?TVlOZFVsSkNMdDg2QkZjUHdDdXBTc3FIOWJwM0huYmxQSVMvcjdDaHpLUUdE?=
 =?utf-8?B?WHZxZUpkY1lGMTZTOTVGVnhDQXpEcTk3Y2tPNGN2KzFzcU9sNFYzcG9pT1JM?=
 =?utf-8?B?LzNkNEJwOG13SmpiWThhS3VUMkdjczNuWVJQeDRaa3FORkQ4UEprL0k1bVIz?=
 =?utf-8?B?Mk5ERjRVT1hscUtWTjFKZlMvY3cvRnZCN0hlWFlpUldnWWJZS25tZGErWUFI?=
 =?utf-8?B?QTF1Q0NuVEVzZ1MvRlFIdTZPRVlJcUFWQm45QXh4d3BmT0VDVnRnNGFIRVRa?=
 =?utf-8?B?cTVrR1NoL1FMdG5OU0ZjU3JoNW1VTEJGTUpZaFdCb3FNWTVnRUFQZkZrYXA4?=
 =?utf-8?B?dlR2TlRRYUwrdEl1N0RSaUhJWndDSURLUkxaZUdRc3dlRXprTTFxd3lGNDlu?=
 =?utf-8?B?OTdJeUNvZmYyb2tnVHhOTzFDcGFwV2FudSs5MjY4aGVMd0d1NFZaRWcvLzlr?=
 =?utf-8?B?d1hqYmRWQWs4ODhxUGFtMmxBMHVOY3NjK05uM3ZHeDh3L2ZTMnB5TTl0UjJv?=
 =?utf-8?B?ZEpTZGhYcXFFd0ZGOXpSNHA2cFJJQXh3cmZRMS9RM0xiVU5vQmlMaThjaGFJ?=
 =?utf-8?B?YTJoNWNwK0xKTGFzMURhUExPeUQ0bWlHUkZodWVscWJyVTlCSENzSXVkWXQ4?=
 =?utf-8?B?R2hqZHN5MFZhV1RlKzhwYjZCNVRLQlI5K01zR2l5ZG43SVc5ZG5DMU1uMWZx?=
 =?utf-8?B?RGlWM3BZQmlGMVlkR2Nad0VtTFJOZDdpR3lKTHlqV0JFWU45Z3Q5RktuYjN1?=
 =?utf-8?B?RE5SeU1ncnBLUGdrQXJmUnVEek1EMW1Tb0hYRlBtWlBKTFlzUTVaYUw0WldH?=
 =?utf-8?B?K0FSb01vUjZLMVdlWE9aYzBMMXRqWnNDS1d2YzZRWjZrRzFieVJMYkZXVGRW?=
 =?utf-8?B?ejNzaVhsbGxSRzRVZGN3UzFKNmRFMUQ0KzNDSkFOeG1PYkp1UEt2bElCeE41?=
 =?utf-8?B?OGVxTjlJTk41SVFPWFAzTVBPOGpRMXIzN1hNcEsyU2NIdlE5T0htZVdtL25S?=
 =?utf-8?B?RDBQbnVwbDExc0hZdjFRTXNKcGJpb1lFSkg0YzZvTFUvZ2VoVFh3VkNFUE1n?=
 =?utf-8?B?amlKeEpxcmc0R0JhZkhVOUxvYTJpVkNKay9IV2JWVG81SzJSN2hQbnVjWmxi?=
 =?utf-8?B?N09tSUZIaysybDMyQzV5a2lhR1JKQkhQVy90MlhtZGt3dUJnTTFwUkYyc3F2?=
 =?utf-8?B?RXNwVHljMVBIaWM2SkNFMVZIVEV2OStsc3RLdnhaRnc4TjFGSS9UbVAvbmht?=
 =?utf-8?B?cGNjZ1AyUHpFdks1RForU3BsZDY3STNyRGxaMjNKWDVlTTk4LzI0aEFOMmdp?=
 =?utf-8?B?RmlaSmZKQlMxTlFpK2wyeEw1eDJyNUh1SUdiZzhiNzh2QjBMaTVNektjYTNJ?=
 =?utf-8?B?VERRQm5qK2o1SkttSG9JRXFPRlN3b3dzN3J4RDBGR1h1WHF6bFdHVnFvc1l2?=
 =?utf-8?B?bXo4cDd1Q0pHYnRFYkZ3dFE3elNkL1BmcFUwZUJydXlSeE5PU25MbU9qTmlH?=
 =?utf-8?B?MXdNNi9PYlpKTzM4dXQ5QUpZeEhYZHpCbTBudU1pZ2RNYWxlMHhRcXgvVy9k?=
 =?utf-8?Q?ue4r/6Vovsev9Iy61TAhA1ZLN8T2ikLqez19zYxCDc+gv?=
X-MS-Exchange-AntiSpam-MessageData-1: ZSWDqxAx7y/wBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d148d91a-c6b4-4933-48ef-08de7dee8d5e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:26.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1muEXyELbAtALjMXNlHMSFjMuNbpwwq3pu6MeHxUfuoFs45wbCsBKnQg4oEaTArYsfII6ZAkZhat/5GRZQ+NRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `into_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
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

