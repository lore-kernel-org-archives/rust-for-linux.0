Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF761B4244;
	Sat, 14 Mar 2026 01:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450407; cv=fail; b=fQr/De0GKr3vITmeHfA60809xlGTrbyAytHa5hd66OOY+9JxZCOUyqdSROhiQf1eaYOqjf0//Mp1NE/x9B5E8htk1uYi5XywE/m/GDKAMtPy3EE832fbkdf0v1PL6evZAXuH32yMA/HDisrvtW+LJN3Mt3p3VH0dTnSbt03jHPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450407; c=relaxed/simple;
	bh=s1ZY5UjravxF6orXaQnV2BPeU9346o1GOVyeBfDj2+Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VIhoj/4CQ7avXhin6O7EGHfKxVIMX+1ovVY6A5zkCJL5R9pIR/Lw70wL8VfaMzWsG/G14PKXpOAmS9Pa+CjVh5QkeLsD188QyynAT8K9TYEQTf7Bzjngj7XY6CAPT99e6hihihUiDpRGo4SVl07ldABpH9K7k6YTsn1N5ibMCZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uKysr7dr; arc=fail smtp.client-ip=52.101.43.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uKysr7dr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5kTAeWNIeal8qXZhUa5g6ri/2pfOfa+/obMC1lOuNyZavbnTpbHfgEIMGDf7nE4qYruQ5e8rgxIJUvRkmWHxz/CqXEfkGz7n7klPBD2X9jmjVYuNXfNQtXJbfUJHRcUkeC5BYlLWYB8poMPDDMObHHoXAARrHy80L4utVxGK0ZpOF86uNeJHVxMUlNORb8E9dbRAA5mn50oBxma5ttGTTFuKN5d8lL41MUuBwnkGf/9/+7n4v4u8MfyOQ3RlAZmeAw1KP7DBlA/4khCO5sMw5EyOwUZFaYvK++QI25TA78fiDHqMoPqJM2hsUDblfleL/+HmCIwXDrHQPp+x8YBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDdXjlcBiC5X5uW1KKVSvdZBRIiMUXuzKu+k7F5RJ5E=;
 b=HTIiKX+U5/o2NlbkBeNN0B4KyB2K/VT9pCo7MboE8jBf7co5nkpR8ZFUTEYYAMzx/nN7RprJGPbKdZ7nqRXwWaMY42X1ZedRosVaUvOX3+KGts3Vh4caaJodhX5kguyUPmJ3HeDigLWqnke8plhdN+WQ3MFHs9vzFip4bTyPYk781l5yrqhff5IMWfGNyidG8EGTnsyTeKcK1qadP1WBSLpzIo4llIobURQC03d7ko1R2ZkRbUXEfTJhrnPwFktdipBCqE3bMmk4bMU/YoTHGZKPVdSd822+J5UihY2GNTiInMEhC1tC1RsqCsxj3c96L4iZyuxtIuR5dRIpG+SFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDdXjlcBiC5X5uW1KKVSvdZBRIiMUXuzKu+k7F5RJ5E=;
 b=uKysr7drV1tac1i+BWdDlcny2aTHh4sDXZBEHoatdL1jf02X2F495uH/aPJ4mFSef2d8UF7N2cKJ1i8aJ0IIXROnGCSF3Bbrfop1lPsATMiYket1x6rgi8Kcau3WVTDjBstWirJwIBPWL2q/TQi3KiqhCixDbQgBDSVuw7KIwgxq9vMAM7lTfe4pG1mKzAFxD5sPGEaJRexnWtpZg8QejmSmk+SgacVqb1L0ZLrsQCyUlGKcWBktb1qtYTNi77+KhblGFZsK47EvRuLViZtLCwKlfJqkpg3/rEYkuVmMEdvcjS9rn33KvffxUzumjreYOy+WV/1bv7XhJF7BUSDt6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:14 +0900
Subject: [PATCH v9 04/10] rust: num: make Bounded::get const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-4-86805b2f7e9d@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 01166557-f723-42ed-55a5-08de8165f4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9k6nqCCzjqXydTxut30RSos3c9uKQ63xEYUkNtb7KHPlz4yzzknHwGWHneQVVOk6gI3cO16xRWmIK/33rApb7pL1LpLtZbkwTq5jPb0vpaqNTG9A1bcf3+P7M1MykZphpBiYvwFlMSgU75LiJSCQd/Ew4OGUuioA/Ko+D52CmV0I5gByIpiYUJHHyBtg4kjOP3BshNaSoGRDJv5QE107+OQniPdjBvjI8eK86VREdtj3eWKSv1dZEe1HEMicRUunPi48hSXVorQd8P99BephxwnU6M2s5Ui3uPaA/neeulXocFDxvRGT5aVBHE6pK9DFO8jl2m/78nWeTTBK8PPzXHbpKEuY2CaOxAf01IgqZHSHQbKk3sX8sPK/drqaJn/NJ3UC3RMZdv3FyK6AgwPyBnV5k4LfPgf+BCtDXb/3UqDqFj0EtCuPf7owS+Yuh4Bw8TWPJ982YNftTZ+90eFVzkKzG/Ifwq223XD5On+5ilmF6OJQII0pnZG+XjZrnR4vnSxvuYP4S7pUoRx8SJBWVCIePr6ftPWm1Lu3xZG9Ey0gBYtCyrWeezojCcRVCLqfdHQAVYa1imC1TCaQof+ivgQEkECjREc5xz/lf0AY9MYIqeba4IlvgsZ8tCTNfqHGVvOuD0ukozGVeTle6nl43LGnA1517841h5MUXxZUdxm9sikvxKDj1l+TI7OOXBnQ5hjZZtXmCXLYQAqZqevktDDMHQLW21Osid8nGGp3hfSAMmB4p3jweN1Ia/SqUBzOxQCO4FtWT5eCybAkOixC5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkhwVVFxckZkOCt5S1dXVEpmMGNaTHpsNzNPV1M3QXYwa1NFd2w4bTVKNzUz?=
 =?utf-8?B?dXkrQ3lTZ3lLemM2eW4zOGFEcHEzWkVYNDZiTGJiL0NxSkNsdzFSOGwrT1NB?=
 =?utf-8?B?UDVDSFBvQml0eUFvYys3Ui8xSE83aFBjRlZrRWtHb0dFUWp4N29mVjZBMmF2?=
 =?utf-8?B?RXpVd1Yxa0dab0pFYVlqVWVsOWsxK3ZEM21KbEVydmd3Z3o3akdrZTlVTytQ?=
 =?utf-8?B?cXRKY3doWWF5aHhLRVhmTS9NQjdtVlQyRjMvVFZqSGUweDlMMUlPUGszNmV4?=
 =?utf-8?B?dkk0dkYvWDlQc3lLTCtIQTNNKzZsZ0ZXNElrR08yakRLVzFOenFKQVFPUWVm?=
 =?utf-8?B?LzF3UlBrdjFkcEZkcktzNEtHTzBTcmFGOVFEcFgvL1lTM09jcEJJV1ZtUzJa?=
 =?utf-8?B?VTZ4OTNCcVd6aEVvM0FlcW04TDNzZ1NWYnRaVWdWTVdqQndZdTY0SlM4bDdW?=
 =?utf-8?B?WGNqTGR0bDdhYmVKdjVzVjBOY016dW92STd3ZUIwcU9xaVZkRHNFcWZsYUUv?=
 =?utf-8?B?cWl4Y0MrRVR2N1pta2ltZFJtNUorcW13bVEramV1V1doR3pVMkR4cG1ROWsw?=
 =?utf-8?B?dS9iQWM3U1d5dHVoQkZqbmttMjFYTDUxWE9hUFlYM01BVjc2MjliVXdrWldY?=
 =?utf-8?B?ZzJTM1prWWo0TkdiKytXNDZrYklqaEZ1WEZFT0xuVVpkR2xWQWxBUlBOUXBr?=
 =?utf-8?B?L1ozbW9idnp3K0lFQkYwbmpubG9adEJ0SWswcE9HSWM1Z1AxZkxSRW12V25k?=
 =?utf-8?B?aDhzeDkrUVh6VXVFU2MvS01mejlzd2xqaXRDR2FuUDRlM205TURvbWEwamcx?=
 =?utf-8?B?QmdWMVl6bnV4MXBVL20zT3RZendaQnZmZnVERlVPK1dKUzR1bG5pV3RNSGJS?=
 =?utf-8?B?c3FjVm5uS1NaZEtzWmFqcnZhRFpyRXR3YURjZWZCWmZkNUdBaVZtbmlKaEpy?=
 =?utf-8?B?eXdyY2ptbkV1d2hsaGxKUkJiWUkvVndNNHRFZUMzZ005WTJRL2g5ZGRJVXNp?=
 =?utf-8?B?L1Zod1QrZGJ0V2VMUUVVeVMyUlNzS2JCZ2t2VnNkcmE5NzNlMG9kMGVzRGlt?=
 =?utf-8?B?L0N0eGd0bFhCWVIxWnBvTlducHdPNXBEcU9sZGtGOFlhaFB2bU41d1VQQjVI?=
 =?utf-8?B?L2pacXdVZlNKUzBoVUI5YjNNMmdWOUN6OHd1SDhaNEM3RENycHhmS1ZxeXJZ?=
 =?utf-8?B?d2puNjlKYlVTVWdaamE4SHg3VDNhTlZFMUV2eEFPU1AzUjFkTEZqcVQ3SWZk?=
 =?utf-8?B?UzRHSDJyeU15UEkxemdnK0lsNlJuZklHZERUN0RlT0dOU1FVTks1TU9uaFp0?=
 =?utf-8?B?OFFXRVN3aDYxNnRERlNBcW9DWkZ0SlFBQXVtdGZpUHpmVmdKNWxOUzl0c2pv?=
 =?utf-8?B?UmNUbTBjREJkNk9jRVYyZU9nNkU2eTV3OHVFWm95T1cwYURPSHJwR05kc3Uz?=
 =?utf-8?B?eVBJakZqOFc3YVRRK2tYbHV5Qk5SL0FVeVVsVXBlcXVGMzFSZXBNemsyV3lO?=
 =?utf-8?B?N2VVelZDTWFGZzVaZjh6VlltN1pEbVdTWDEraXF1SC9NTlhPSTJkaHBGcFhY?=
 =?utf-8?B?eXZaQXl3ZlhSTEsrdGs5cnppUUU5V01jelBpVHF4ZU1tQTdhVDczNHJZUWtn?=
 =?utf-8?B?UllxRDVLYkpuOGVXMGs1blJteVF2WnlVMUJ2aGlObkwybnRXakhBVDFJRUty?=
 =?utf-8?B?UVpHbERYTHdzbGxwRDlDR3FQRHhqSzRIaEk3dHdkRmkvYzg2VFZVdS9PSDVW?=
 =?utf-8?B?ZVRGV3lrK1g2eG96YWxnc3pVV0VEYjV5akdYZzhIYzFFQlhnNXFxTkErSXVX?=
 =?utf-8?B?bmhsUGQxQUpySXdLbi9OMHluMGU1TlA4ZUJMYkx3dDhkUytrdlhLNGYyK2tZ?=
 =?utf-8?B?akVYZWJid2JJc0NXZytkVDczK2hhNmdxZXpJQnJkcVJ6dlhiYXNrZzFWdUpY?=
 =?utf-8?B?b1Y1NlplbW1qNThNQlJ2M3BTaGJwd3R5YVlMaDBkZW5mVTdWOTc4elBkY012?=
 =?utf-8?B?Uk9IZmMvdU0xZXRQbm5QZjlZclZ6WVdwK0x1RE1xL3ZxaGFTc0hSeExaOFZU?=
 =?utf-8?B?dk5VWitJaTZGajBJVHZZK3pHZEhUK0V2RitJY0ZZa1dBR2k0cm5FTHA5eVAz?=
 =?utf-8?B?cVY3NmZwSVJDKzJmdWduNjVWaFk1c3VTSGlZM0s4OVlXSHpyN3JQdjZIQU5l?=
 =?utf-8?B?SGdHN3pmaGNJUWNveGlhdEhxZ2VHK09sYTZOZi8veFZxbldUbFBXVDFZY3dV?=
 =?utf-8?B?ZVZyUWp5ZU9POElyZFdtcmw2cVpGV1l4Ui9talJzL2h4TXVaMzZ2ZEtSQjl0?=
 =?utf-8?B?R0g4TkFGMDBiRTQ2SndzVDQvTEFWbVo0Z3JveFRrZUs0NkFzeWRsZTdqY2pF?=
 =?utf-8?Q?NvfrMCba+nvdZCipfum5VClhs8aQG7ldmGP9kwSRZfrDU?=
X-MS-Exchange-AntiSpam-MessageData-1: l95YpV1GDbOrag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01166557-f723-42ed-55a5-08de8165f4bf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:43.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+9SPRkmRf4jv8SVwBd+229a1QNqEsIU3tbKUiMxCj+BYBrTPETAaMwH+Juq8AcvGz8umm1kmiLi5Eps9lG2nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

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

