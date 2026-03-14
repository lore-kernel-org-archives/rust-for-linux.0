Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F61242D60;
	Sat, 14 Mar 2026 01:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450412; cv=fail; b=bu3DWqNHh6k05PplD6YRxjYVgcVGJnn+I1wMVAnEH3yGhMTWysd8kgFViwKY4EQvSN/hwNfsfonpbJQp6Q7EcfFakGxKGstnwJmh2uw1e8qRO64WJhP+ddl95EJzur7Polqhhz0q0YwMCwaST3wPe9ZrUVggG4PiRFnz7k9kJWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450412; c=relaxed/simple;
	bh=Be6i/LAWzJb3H5rLICjYFOzv1Z3ybi5aWcJSmZNItSE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=molxlcpDW9Yr/frY+boLi87N/ZY9gtzh9URRythTbQXcw7jRBDDmo04GxQcb4WmmNNwJCJwa6OEWXtsq2gw00SGxSZw07Q+TUdnmdujnkzSvrlJNCqbudf0DUImoYj6mY+MXGQccokNSIDNGiZYuX2PknCTTPftQhxCaiXHyA2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JPY4byY3; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JPY4byY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjDPVpI9QkZC62J1W5Yxq3LXs8ct/7dG/T/2a8AOjnc9YXMMtbkKSy/d9/ImU9g/LEFJWw5pDs7+QzvknQc40LUMDrO973HgE5do2FW66wRQcBvLajCO4seJxxLm00rIAr3V9rzcyp/qpgclAA/fa6IOBfb+Rr0FXrbFlKYACK1ynQvsVUKeuiJq2mB5yot5IM1XF+FsLzK67KrE5HJirD6TN8oOx9VXYtRhubv9M9rySP8UjXoCOp6AmZF9jgvdjGDK5og/nriB3uikkYREtEjA0ntJ21ezGQlTuXIyGn7XJbqXyC13PqNxZuVtchJil3qW3kytWav1McnKh+O2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYyB57HzUZsex5eIfTQsMEr5ONVaNyUU4s54AQiE3Zc=;
 b=MBnHO0gS7D3OKKi3pqZKcnQc+dcvqEL9tRJLHRFKTY1IztqLsj9RGruI1WpqOg0VWdywJattQkd2sJY5xxm0/XHDMUANk1YVOwtcM8Fxw8MZPOd6NN9EEIATeoKlShxuVfa9qIRYMgurv//XC8wQc5LQrYfxynXm8bJup+pba3Yi/Wk5jR8yxIWLXLqb3S6Ys6o9m/xf895KBMAUQSesOeqgIulg0kbfjDBLKRfojk3YcRmwesGCZIAwvRBK4gdIX39DcGdj5GX1H9xrD6ETh/8f4uUVvDfCt09UXaixsJ8ESyMQsB2qoj707xim+fmOl/yvIuYW+RNL3C+cNSbc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYyB57HzUZsex5eIfTQsMEr5ONVaNyUU4s54AQiE3Zc=;
 b=JPY4byY3IVBWmSz8Hm8rTt9kCRSQcv6U7f57wq++unuH1DiTIppsI5AQ97g17Bph2kdvsou2dFU5Hxd1fsVZgr1dK9ie+x4Ok3tzPpothy1oK10sJx1Kko1CrMHNKl1WaPq8/cSrZ2sSMyyyrgYtz+IodK8xIqRSKhE3V3PRNv9qVkx5LX/g4w6WzP8YywkhbXTjWcvfUYeTubf9RV9aY2B0RnZhzPPkAAwffPUettYuud7+3zU0QyyeIvdFmmWuHaKhO2yyt/TxEhQTCzlA2sG+bXsN/KD5ZJ1AYWlXAz0abxDf9Hojoahj2ZgPHhg/IvWCuRuCi6VnLw9EWzr9DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:15 +0900
Subject: [PATCH v9 05/10] rust: io: add IoLoc type and generic I/O
 accessors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-5-86805b2f7e9d@nvidia.com>
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
X-ClientProxiedBy: TYXPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:403:a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad6f8fc-24e7-4a4e-1c7e-08de8165f768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ezPcn+wF/E7wzMEoP1DN5utTJewPmVZKSBeYyCBxUBxE0P20lfpXV0WAgbiLELw5gpx3Bgye3c4vCN5DJxgL/llzpPXF/zgk6Nn9x5Lh8l3hm1a0H+o92HB8MlsQ1wFaS77aDeB922BvOOCFgRuHiRhsY6wnv0fFw+tO2C4px9QzBkCEUhRJi2/piDfmyFOdbc/Ge7dj+/7jpCLN2ZMGvlTV0g4rcukqLrhARo/eySOe+oFmYuRZJMNX8f31yxPlgTCoY/VztqYIhySAO5KqggHyIG840wgd3xvVghZP8R+25nUR+qEN20wQX0vxhGzt7jSqWQNqJIwuhe80dspxHhDVFBa4tc2/MD52dyrHiVBn4cXcGV+SOQeClj3/Z1Q//zGIB+RKk7GpGv9XLQ9vdJvo++FVPkeaX0e8ylVoznFfpfyIdLP8d3cuvzvOIXs7O9hKyp138OZ+7gC71SDxSQ/6Owe6/ZxkqsL9Se2XEe2rp2xvH7Y/lkyLa3t7udhP2pf8e/arB086dY/7jbAtDzCzWfRk+Obnf9O6/sM/X2POET2VITn0dEm2yzviW0Z5oBZtN4LSRXf1sSGBc64JR04GTIB0S6u43XV5xdJb5D+ClR1I9jYw1PNHUgGej4b1W/K5POegJRbObbwa9HcEVsNIVwWQP5nKVzwY1QsOvhy/1srWKXCDcNEUdkOjxjF6087jeI99KcqCzncm0jrubrPiVrjUt3UHohxYn5F5EuviZzdCfq6cb5Q0bquQK2tN3C27tbV4P11frYzeS6QKVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVVMV3lrYjZQOExhSWY1ZmJjSHMyQUdjTDVvbDhodmJCcEdHK2pPOENTYnFO?=
 =?utf-8?B?RXFjb0NnWWxWY2FRNnBVTjVXRmQ1bi9vZXBwTmxrREtJWnV3UFFPZWQyNklE?=
 =?utf-8?B?TUdwM2Z5dTEyenBZL1VodWcxaFRvSm1OZEZmVnJuOWx4NkRNYm80KzllQlB5?=
 =?utf-8?B?MWxKcGJRWjlPWGhRWWt4aXJCY0V2aEJiaE8xRjZtWkI2d3kyMGVxQmhCWXg3?=
 =?utf-8?B?QkhVN1pKbmM3Ykw5dGNnRG43cm1RWXVkM1BzY05XYXhacEdNOTg4aVdvVTNx?=
 =?utf-8?B?UzVLaTdVeXNYSmczZS9ZeWh3c2dwMGJGS2Jnb0hySHVKQVFwc1BGSEJzdFBG?=
 =?utf-8?B?RnN5RXNxZmU5QTkyRU8rZk50YmFoRk9yaEFKOWUwVThETDFXWE1YdHFtY2JO?=
 =?utf-8?B?alNmUFh1VTlqUU9uLy83cHg5K0RmZ0N5Mi9lU296a2ZxSU1SUG56cTcwQXcv?=
 =?utf-8?B?VUhpR3lTYlZLYUpJWTkzUm9MZjBjcmRQS1FtV3IrdEw3NngwZndMK3dTK25l?=
 =?utf-8?B?ZFNhdlA3YkQzYXdWSlY5Q1lRdE1DU1JFbm52dDJ0K2ZMRVIwZXNKQkZVMnJi?=
 =?utf-8?B?eDVNL2J4NjE0L1pUNUVoSzc1RGtrK2JSRWhzajMzU3l5dW1aRkJOL2wwUW1u?=
 =?utf-8?B?UUtuU1ZuRFhJNyttZWd2WWxsS3o1U1FZVGh2Z2plSU9pMUl2Tmh6eGtZSGFY?=
 =?utf-8?B?dFljKzl2YklRdHQ3MUVQcjk1aFkwNisxSXhoVGZmanJxK200UG13Vm9TSXpT?=
 =?utf-8?B?WWxQcEIxSTczdVp3anpTOU1DSTVJSndVR2Z4ZU1ocWlTYVUrTVk5VndoRDVp?=
 =?utf-8?B?bHh6NHdGVGE2V1BITGVrRjRURnF4djhwTzNEYzJiUkxhanB2ZUdvYlN3ZkZX?=
 =?utf-8?B?Z2xRQW9xWVE1Z3dzSHFxeFFWNUF5eEJ6ZFEwdVo1TzZTb05KM2s5RFNoaHhr?=
 =?utf-8?B?WVhLeDU1bFdhOFBlbWJkQkRsUjhFL0kwakROSWZCVkNyS1Biazk2RkNjRlpq?=
 =?utf-8?B?VEpXTGJNbG9sMHlERHpsNHRSaEo4c01lL3FUWGtudVRnWExhdUl6S3VSWXFz?=
 =?utf-8?B?TUhpRkJDdGpla0dTRzVPQmRrN1J2WTVXZnFxdThUb2RJVEFUOTM1RngwOHNx?=
 =?utf-8?B?VGhUS3ppTDNzTkJId3RQT2dBcVZsYXhCRlNpbDYrRnIyM1poZWU5UHpBWFFZ?=
 =?utf-8?B?NGtnZzR1WXlYWENiejlkKy9iUFFNV1Mvcm44VXM5aFJuNTQwK0FXak5xREFV?=
 =?utf-8?B?MnNUTGJ4MTdpTEN5ZTVnb2lrc0F0N3pyRk9WZC9yaUhmMTZtSkdBcFEwWHdU?=
 =?utf-8?B?SVpFYTJCNHQyaEFnZ3lNd1N2SGtJTTdDVE8yc1F4TDRZZCs1VE56ejJGTFhU?=
 =?utf-8?B?dWQ1NUNYdFV2VXZ4bWo4dElTUndVcmhLWUIvQ2pod0RjRHFVMFJYTUY3a0Rx?=
 =?utf-8?B?b1h2Y3BmbEpUT09La3N0blo1Z2JRc09GcEpTS2orSUNOamR3RlU5bm54Mjhu?=
 =?utf-8?B?SXR5YmhqanZlSWpVUDRJTUI4WlBCaVMyYkV3Wlc1cER4KzFrVGVORU5YZExo?=
 =?utf-8?B?RDhWVFBYNnBIYnJNazlmREU3Mmh6amMySnU1N1ZveUplWWxPQjRJZ0picGRJ?=
 =?utf-8?B?aVhUQXFKcERhTm1OUnJ4bytSTjZzRG1kQ2haTDJSbEQ4OGJBRTJiYVVrUms3?=
 =?utf-8?B?OHpWdEFiaGp5dmFDTXpTYm8xUzdEY0FxWEFXYjBRZ1hEYXFWMFI3UHU4OU9Z?=
 =?utf-8?B?NTJrdStQUE9HdHhlY2o2RG1BblZiT2s2VW1pMWtOZzBxNE5CeWNYY0d2OVF2?=
 =?utf-8?B?RHIzT0hDZjR2c094VmNtaFo0SitYam1tQlVnR0tQbU1jN0NtelZlSUdHUzhR?=
 =?utf-8?B?V251WTU2eGkrMXhnNi9NL0ZFV3BtY3Z4S2Z3Wk1RWmpMaFpXRHNnN1FjRk5m?=
 =?utf-8?B?ZTJoN0tML3luNHRRVmk1M05jREVzdXBzVFM5N1RhdDNDMitpenh2OENDa09m?=
 =?utf-8?B?T01HNWY3elZ6bHgyR1N5a3NGS3lZZXVlTWF5dkpKYlJGNHAzdlNaZVAwMnhs?=
 =?utf-8?B?SjcvUFlybkFwcFpLQUNKNmFoWFJXQ04yaG9iQnlsaTZJdko3MmZnc2N5aXBL?=
 =?utf-8?B?R2dIeUpWa3dzN0lYZzUvVzRqWXdJK000dlVYc2VWUVQ2cWtMZ0VzY1lRVlV0?=
 =?utf-8?B?SW41bjBzNERxTEt1N2dJWWZ0bWlrUldHZjVYWU9tMVkycCtHb0lnTE5sd0lr?=
 =?utf-8?B?dWZUVDJKa2FoVXo0S0FwTnBHRCtyRFBwSWoxcDVCS2JIQ2t5YTJUUU82R2tr?=
 =?utf-8?B?Z3JXVXBHbUdxaVNWc1FOTHFrVmlNMUREdHFFVktEVlNNSmptM3BVZUtla0R2?=
 =?utf-8?Q?sBn7f81G+jXNRs8PL5XwRUiPTC01hJCdpndP1Gnzq61VE?=
X-MS-Exchange-AntiSpam-MessageData-1: woRL+Zne728nVA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad6f8fc-24e7-4a4e-1c7e-08de8165f768
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:47.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLrfzaCZ/AN3xWvlllyC2FhbnzUH0WqPZjdmvZ6Q70Hy+u2nPk0O4BKT/WfX7bqJqH5fh4MJ1RwGXqpdH5RmoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

I/O accesses are defined by the following properties:

- An I/O location, which consists of a start address, a width, and a
  type to interpret the read value as,
- A value, which is returned for reads or provided for writes.

Introduce the `IoLoc` trait, which allows implementing types to fully
specify an I/O location.

This allows I/O operations to be made generic through the new `read` and
`write` methods.

This design will allow us to factorize the I/O code working with
primitives, and to introduce ways to perform I/O with a higher degree of
control through register types.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index b150743ffa4f..e7e32f921efb 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -173,6 +173,30 @@ pub trait IoCapable<T> {
     unsafe fn io_write(&self, value: T, address: usize);
 }
 
+/// Describes a given I/O location: its offset, width, and type to convert the raw value from and
+/// into.
+///
+/// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`] (and
+/// their fallible [`try_read`](Io::try_read), [`try_write`](Io::try_write) and
+/// [`try_update`](Io::try_update) counterparts) to work uniformly with both raw [`usize`] offsets
+/// (for primitive types like [`u32`]) and typed ones.
+///
+/// An `IoLoc<T>` carries three pieces of information:
+///
+/// - The offset to access (returned by [`IoLoc::offset`]),
+/// - The width of the access (determined by [`IoLoc::IoType`]),
+/// - The type `T` in which the raw data is returned or provided.
+///
+/// `T` and `IoLoc::IoType` may differ: for instance, a typed register has `T` = the register type
+/// with its bitfields, and `IoType` = its backing primitive (e.g. `u32`).
+pub trait IoLoc<T> {
+    /// Size ([`u8`], [`u16`], etc) of the I/O performed on the returned [`offset`](IoLoc::offset).
+    type IoType: Into<T> + From<T>;
+
+    /// Consumes `self` and returns the offset of this location.
+    fn offset(self) -> usize;
+}
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -406,6 +430,106 @@ fn write64(&self, value: u64, offset: usize)
         // SAFETY: `address` has been validated by `io_addr_assert`.
         unsafe { self.io_write(value, address) }
     }
+
+    /// Generic fallible read with runtime bounds check.
+    #[inline(always)]
+    fn try_read<T, L>(&self, location: L) -> Result<T>
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        Ok(unsafe { self.io_read(address) }.into())
+    }
+
+    /// Generic fallible write with runtime bounds check.
+    #[inline(always)]
+    fn try_write<T, L>(&self, location: L, value: T) -> Result
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+        let io_value = value.into();
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        unsafe { self.io_write(io_value, address) }
+
+        Ok(())
+    }
+
+    /// Generic fallible update with runtime bounds check.
+    ///
+    /// Note: this does not perform any synchronization. The caller is responsible for ensuring
+    /// exclusive access if required.
+    #[inline(always)]
+    fn try_update<T, L, F>(&self, location: L, f: F) -> Result
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+        F: FnOnce(T) -> T,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        let value: T = unsafe { self.io_read(address) }.into();
+        let io_value = f(value).into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+
+        Ok(())
+    }
+
+    /// Generic infallible read with compile-time bounds check.
+    #[inline(always)]
+    fn read<T, L>(&self, location: L) -> T
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_read(address) }.into()
+    }
+
+    /// Generic infallible write with compile-time bounds check.
+    #[inline(always)]
+    fn write<T, L>(&self, location: L, value: T)
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+        let io_value = value.into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+    }
+
+    /// Generic infallible update with compile-time bounds check.
+    ///
+    /// Note: this does not perform any synchronization. The caller is responsible for ensuring
+    /// exclusive access if required.
+    #[inline(always)]
+    fn update<T, L, F>(&self, location: L, f: F)
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType> + Sized,
+        F: FnOnce(T) -> T,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        let value: T = unsafe { self.io_read(address) }.into();
+        let io_value = f(value).into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+    }
 }
 
 /// Trait for types with a known size at compile time.

-- 
2.53.0

