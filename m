Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419293DA5B4;
	Mon,  9 Mar 2026 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069276; cv=fail; b=M+h9nkYLa5T8o+93aV5XQ6VYXiCUXSC1+d8qVToQFpkRgPRiOhIzM5ssGslm6puc9VBZFWv8vVWnlFlGbKy5Q3ep5ipH7+U/tFVyZKAVmyoDMdSnAycb6v/3X/VZjWNEZK1RejmvoVIsszwNnLZVLPw/uAY7WPO4eeevr0IOmAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069276; c=relaxed/simple;
	bh=s1ZY5UjravxF6orXaQnV2BPeU9346o1GOVyeBfDj2+Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JBMPm4zsYvvv8vHlj17Kg8j+3dDTi4Jcjz3uI+SKIZaQhtD3QaM16EnYFuuBGATtNyr0petJ3zzcqZU35Bh+mpniXYt1yqyjlOhcSQOhfwsns/+y2ABTA09MIfRqB7urNuitbaHYdNEcFaPuHKDFp/2F8YQ4aZ86oirZ+2lYj9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rRG1469m; arc=fail smtp.client-ip=40.93.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rRG1469m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4Mfz17BOMz2qrtB9hZfiSbB73Y+Fx12rz4cR2KB/lp10KFCJun5tXUlHy4GQvivF+EO2jhDFm8Bq7FNe9FVs8QVNijcVpooLCFgEIw5uDi5TXDEku5UbfaWzCQrlcOsiqBqTWjwlCtg3REXhUP6lMWO/9Sv04DzqtYYA7wQ8GgyZiLeGW7UqSxiRuPaGXzXhw0dGuvHPkh7Fpme1bPPV5NyMz/XdyCoFPQjn+qZlnp2ost2LzYP0KpepPQ82oXP1xHyQeRrPH27SwHw0+rZ0fbCFdHFWzaiYFS3sejx7qcGmLR5svnBkSptJs1ETh5z3vVD/rInhGXOsM628/VR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDdXjlcBiC5X5uW1KKVSvdZBRIiMUXuzKu+k7F5RJ5E=;
 b=gQaOW+ci1IZl1WSywtJ0h+qj73uzrs/Z/LxDWF2XCvbB/ja8ilALIwvUfoDb3dpUhs+CAt7LVQSQ7H+WKFpYW820NIslTDLBgjkXMfDACPs+ewGnEB2PdIo4sPK6jUxc/yNfrDFsLRGGxvh/qeEaAjZQR+M85tWWxoQoN59Gyzt61iyIgtRobqUF2dd2j+t80lBWtJckjAf8qULWCM68P0auxZkxjjJnglmUQEQ+t6+OC3m5J+JSrWpw4Q9mjDzsGLHeBpy91OhMqpy+2henrRypPioH5lUA6m2wavg48cqkpi+l7D4h8UqLVflRNxsD3cUFxOed3kL6H3AzjPX8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDdXjlcBiC5X5uW1KKVSvdZBRIiMUXuzKu+k7F5RJ5E=;
 b=rRG1469m+Au5YYEb3EfFQ2FQzz6QSHiHaIEM8SFT6cZVWJn2GbK4IkdVBVSmBsq4CrftOZOjzu23/J7gBhiOMmVQKAmCz4GbkkNx49a/5JCALKbiWnxTsYpblbInXf5zJ1FmGjW4WEJWgFKOufD8pfcDe/1YgfBINj+tQz80b/v0q53BTb7XVc7aLZAvPj5Em+L8RdalH3/SiBYxRKgobvWTQOP6hPWjiCxA/SafBYmXgP/f6PJHDZOeDx2MXxzeEKPug5iLpOLWD0yGcBc15G7kggjAoAVJ0UsB44WltcqJv8o741HEJYTOU67mKRFSNjInuhGEbvx5h5z6ewk3jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:01 +0900
Subject: [PATCH v8 04/10] rust: num: make Bounded::get const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-4-424f80dd43bc@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 406a54e6-c51a-4695-4b7e-08de7dee8f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	7di6NDODcpezvxz8SH6s4Nc86YPbHJt9Jnj+Ocb8IvWv54plNlDoe7r2/kH0kSihc2r/T0XDNuaChRGv58AN76jWx6S/Th/xLb2lIsiu0M+Nj1AR6fhQJsbMYJWQd6cq8z67N8Gbu9cxZ3oSK4JHr/m4FQnicf5VEDwy0VkzgRhpUvnWTxs6kqLfFslXunqv/td3GWYrDL6ERtzSue58nh+FWIIS1GFFbwY8FFe3LXPAkaARHtht1HDpavDlkSvZF1+Td43OXGp7kZ3BK+1FbCB6wQplNrs7G2dLFh9kgdwmJQwMAcg06HDUVkOCmQLFHs/uI8X7F9IL4ZqJRhXJW3O8t1emxAlHXQbprvCbX9RYKY9rCC94v0vJ2j0KKtfftEX/J3+P//iAi7/fhOk1gdqhZcJfM0Am3tt352BvcFd3t3fV620vWl4FN3mnOxv8Xniws3YvgAFxZ5ieMxc2S4IWl6KQxwwC87oIwuonuvLNbhMTDdamUUtZl/bhr8ag6AoWy+nKIGwAu8yYCMz3ENxuXPRIYy9NRrK8Lev+TPjVNxXSUQJzcz3plSpwYzKBUyUT/yoVXVgU4RbxcRGPIVIDGaTZHMrq7VJ7BmueopSKmfGD3W1Ikde3wZsXzeCy+mjB1nNhx8twPIO5oHj59s2FciXTfN519B6y5hFRiBCi96Dk3FGF7pz8n70omEY7BJEY2TlHuptaliWNW9XAnXmvuKtb6aJ4qE9ltU0hFSRpgLCKPJCmvFQo9auxkprbfhEnOBkMsrZeNFJQlqYBCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?andybkxCY1p0MXZYemhCMWdlL01adHA5dCtkR05sNExsQlUxNG0zSWIxV3dt?=
 =?utf-8?B?NU9FbkRSak80cmJHWjFwV0JuQVNBaFJOK0srbEp6QWN1YmxGMFp6U1pYTEZo?=
 =?utf-8?B?d3pJSldFblVuMDd1R0RseGZ3d3d2MmZWMDBrN0lCSFRjV1RiZWthQUpoazZE?=
 =?utf-8?B?K3RzQ0RUeUpQSFpTcTcwUlVxbjhqSloyNEhnTVdYOWJPTmFUdVBPaEFqM0dI?=
 =?utf-8?B?ZjhXWTVOUlpiOTB2SjdabXF1d0VnTGpFbXBPVzY1amowQXQ5d2VuUUZacUJx?=
 =?utf-8?B?QlpWOHJVSlFNQ2h4MU1oemlnZURLMlZvNE1neElKR3ZOM2EvUHdXVmliUGFl?=
 =?utf-8?B?czNMaFEwc1pGdXNMbG94K29FS3BiTGxLU2tLYUc4cjBjUzRHK0lLbE1YK05l?=
 =?utf-8?B?Sm9IMVh0bGJsQWc2azMzdnJ3VVJGb1d5SVIxcnVKL1Vmb0dZRGtDWHFvTE1s?=
 =?utf-8?B?VlZtanRRakg5ZFRpY2FWS0NxNHF6L2JOTVAyekdlT1RYNVIwTjJSL0t4ZWtK?=
 =?utf-8?B?cmxtL1E5ZkhYTitZRmNoWnV1RXZJVUY1ZS9yZmVNL1FoZXdWc2c5WHVuWmJP?=
 =?utf-8?B?NXNUREd0VHd3M3dNd2NTeW5HbEk0cnEwcDFVb3hVaGoxcWxBUUFSV3pFdTY1?=
 =?utf-8?B?UEhpeTZjMk1KSHRJdFJINEJFeVhMWVlaL3FZRWRXbm1LZy8xTllmNWNURnlQ?=
 =?utf-8?B?bHZ2eXRGYXBneEFOWmhLbnEvOENiSzAyK25USDMybWFqN0xXT3pWSzUzZUE3?=
 =?utf-8?B?MkppaWFQMnFldFkrN2JHTE01TFBGc3dpdEVDOEVraC9FNmFBb3ZDYXVZbGVY?=
 =?utf-8?B?TnVvK2ppOXozT21Pam14UWpyWitLZ2tzcjYxakNTRHR0UDFzYmc1WGpVL2ZD?=
 =?utf-8?B?Q3BJMlA4d0JNSTNaSTBUOFBKaGlkdDNPV3BLcVpLUmJrREtkNGUxSlFCSTRs?=
 =?utf-8?B?RTBHSkpmL3FrVDFROUdHdmc5SWpNSm1od1g5VEh3cm1SRXBYaG9wNXJsUEFj?=
 =?utf-8?B?ZVJ4UVZ4SUk2VGl0cG5QTnVLSXJZZTJ1Mjh5TFNydUtJWWptMUJJbWI2ejhQ?=
 =?utf-8?B?TXJVdkxpVVFEWHFJSWF4dWIvOU4wTTVMZXJFWTJhVktDR3Erb2pPdVZ3WTlJ?=
 =?utf-8?B?TlZGUE9TUmQ5aCtKTmd2WkxyMXk3djQ0M05FdFlhSEJMOUNYZDN5Y1BCaVdG?=
 =?utf-8?B?K3B2eUZhY1piM01SNjh6cUI2K1V2ZGlsSHNhb2pvTXpIL24zbVRIdzNkdE1Z?=
 =?utf-8?B?dDFLYVNVUE1YeXlMRVAxbnJqa2g0bjhCQTZJTmVkT2VodU9TMFgxNWM1MWtO?=
 =?utf-8?B?NllOb0NBd1l4VVNXK0tjOWZkSGtRUm9yTnpsMEtsS2oybkpKdkgyVG1JQWlO?=
 =?utf-8?B?ZS9zY0R2YjVhWEM2OVhxRkRlaGh2eUlEMXpKeitwSXZPQWNXcm9vU0I5c29t?=
 =?utf-8?B?aUxONU9WcmlxVW0wL0xjU0pxSUkwYXQyZmRhRXV2c3E1WXJSVXA5QUI5bDdC?=
 =?utf-8?B?ankreGNHWDBrWU9jL0NPcytrbzZEbG5JNCtwZkdlOUcxYnhEMytUcW1iblpa?=
 =?utf-8?B?eUNkM3I1YUhFYjdHaSt5RmF5aC9ybkFRVG91UVpUbVhvdmN3UEN0NmFUcGVJ?=
 =?utf-8?B?ZzNsa004TFZheHpROGFCZWVFN3lwS0d3OUh4MUFnTUtqRHVUMFRUekZKYnR2?=
 =?utf-8?B?dWRpT3VrUUJGNlF4eTRYR0dzc1ozQkY0Ty9UckJYV2wvYjBWQThwbkY1WW45?=
 =?utf-8?B?dnh2aGEwSDJjZ05aY2FveldleDZCdlNzbVlUYkZKYzF1Rk4wdUZKY1FmQzZh?=
 =?utf-8?B?ZFRySmRTOHZmS0pLU1k3cmZJRXRkN3RFMUdyK2N4eVpaT3Q5dmdBNEpzTFd2?=
 =?utf-8?B?aHRrYy9UMFdKODVNdXVQNkFTa3hXZGhiYUc5VU5lMC9VUXNnSnQxeitPbWJR?=
 =?utf-8?B?c3JWMUFONWtBRjhwMjAweS91bW9uMnVveVJCUWErc2w4TG85dG9hcTh1eExj?=
 =?utf-8?B?eEtvNU5ZaXRCTE85Mmt5RDdndkdTSkF2bHpkMzdjUkwzUHBRZEpsckRuM0Zx?=
 =?utf-8?B?ZFBtV21XWUpQdFRJWkhLQXhsOFdEQm1mdkhyekxUNE9mOTVzOERtZlR0WnJq?=
 =?utf-8?B?aHo4a09iRFU3M2h4TkZ1eUIvWlFSRVpHV1RwelFXa1ZwWHdhZ2dsLzgyTTlq?=
 =?utf-8?B?N2ZlSzAzVHhCQVdvMmh5blNMSitZd0ZBWUp2NnZMcm5RUHBLcEtySXBTeWtY?=
 =?utf-8?B?bWYzeFg1WWJTMWdyUVB6bTY2U3RBd1BiOVVJOWNCaDJ3WTU2eGlPMjZ5a2pR?=
 =?utf-8?B?T1hpbHNhaXJxalNWak5zNUFIRnNoU2xzYjhvbVVKcnhtTlVrMUJFNUJpMHFP?=
 =?utf-8?Q?8dv+0E748ndxIkdpSM0CsYVaX4qyzQ+I/Ocpan9rFyqpP?=
X-MS-Exchange-AntiSpam-MessageData-1: I//Efem81yvrqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406a54e6-c51a-4695-4b7e-08de7dee8f8a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:29.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzHClBPYtjuZW6UXcKl7LxTGFeZB0jhNlvb4DqyaOsz63uPfV1mo83czElSuVO7WOE0kcqbDfi5wYGC00kxQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

There is a need to access the inner value of a `Bounded` in const
context, notably for bitfields and registers. Remove the invariant check
of `Bounded::get`, which allows us to make it const.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index d28d118abd8e..bbab6bbcb315 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -379,6 +379,9 @@ pub fn from_expr(expr: T) -> Self {
 
     /// Returns the wrapped value as the backing type.
     ///
+    /// This is similar to the [`Deref`] implementation, but doesn't enforce the size invariant of
+    /// the [`Bounded`], which might produce slightly less optimal code.
+    ///
     /// # Examples
     ///
     /// ```
@@ -387,8 +390,8 @@ pub fn from_expr(expr: T) -> Self {
     /// let v = Bounded::<u32, 4>::new::<7>();
     /// assert_eq!(v.get(), 7u32);
     /// ```
-    pub fn get(self) -> T {
-        *self.deref()
+    pub const fn get(self) -> T {
+        self.0
     }
 
     /// Increases the number of bits usable for `self`.

-- 
2.53.0

