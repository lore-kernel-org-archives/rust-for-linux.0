Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B219463
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 05:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737525241; cv=fail; b=h3oJdTcR1Opxup3/C9fnkLm3zzgglCDpc4ECr2KRFYdaDu043UjeYL1+YdniUtDbEGwv2Dar78C94NzvEmCEfVF7GzJBUpFMQI9pPePqmun7nUo5YQiCXedPLFnuy2kKAy4D5H1c2Ox3eNORdirNqWNfhEgPNKihrCunoyJ5FUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737525241; c=relaxed/simple;
	bh=uxHFMRnedWFSt6+iAE+2GpDmCNviER7TFlFusGlEtfk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rUePbIQZt/MSj6wKZ69yvBSzlGHrJAmHWVRwBtwQhAXazlhAY235e6z0R/onXAib4q3FoPT0O2LGbRRrEYIEZoEZ3Ru/Y5cUX7pA3+z1fvCZUoiEamzi4OBnMPNnRFyv2e5lmZD0qH9cA8H0TL0JoJiuOnmbyNG4rQ+i+cpJlBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=KAnUrpgr; arc=fail smtp.client-ip=40.107.20.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="KAnUrpgr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu8w7v1fxeV71m5wX4jGQPEIcLSxhPRrGDLHc0zuxUTWfAqogqUuHjd/xWg2WslDoyG1n59+RA+6R76FfeKaOwlyCH0q8RY6spfzYlSmkjNbxSp2bUkh7vFiV4TmiZi3S5JuvjogS0ADdE/OuuN6qPebSxI8RGarXohTM8sK8BLGD52c/Rxeiv2ABk3uA+UV+hzDVnh46gLy1SX6g9GV7DodJkaJQGHG72GJNm/2z1ykCM0ZAyffe1f5IMC1DftcPJJXR9WcRAAgRHEeQLV+NX2bjNQAytRzGFqm5h3lvDFbG0U2+C5EIZr7QKpzlWCzFDcaZCeXV4VUNwtiiyf68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfDRbc3UjQbMeea+NZSYG1knLBcb1CR3T/JeoaYy8yM=;
 b=i19MbUOMs0QmfNihFpKAJANAC63vF0owFwtgBUXspDz7PVAs1oEa9sUXDSAP2eK63Y3HKddB+xljqkSqWqtL50Bc3QqFsTmCht1CxXT50V1K7wAaJoBFjRnxzc0nO6JV3pHhOiDiAXvtPDKXeEcu57QxDVSQZhGX9FDDWle+dngVP1OKiXvH3GE1aeU2Bddd+x1VUThjjXpkmtEWcJ9cHU6qhzq/nks2mbRNijK1pObvzbXbqZzRX560ZHyTfZ0YvrXRaluLzOB/tPuRyXpgsoRJubeiMENgZdm6oqoqL6lcayyAdAUikM988/bpsZvskVP7iwJD5JSMRzPz+dQL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfDRbc3UjQbMeea+NZSYG1knLBcb1CR3T/JeoaYy8yM=;
 b=KAnUrpgrdUyypGPhVMXW/xHDL3yiW1tctVwINx2R8xi7B0PoDFgsV4hSE1EwD92YuvLWn3VPg2qyROhMsptpqd5C8udfDJoHuBh/1Hw7Zr6Gg+gLGj8Cd6pkmPWolMxTVAvsNPqcxLfPYzRPUPVSmudm6f4i2Z6AERmbSlFbNa4sM251r3DfnAigNqX2LBdgCXQTsprQYB8Dw8YwMmbpVc2pkGdVb7ww0PxZPLYw4oK7hDXrYUETGFLrESe1JL2YgyBg6oHy/ZerKA/Ut5JyjtMYwwOKyPMra8v/t9zaCjhuP06alcgP+FGvdP41vYstXYJxSCROV0UKycMNuK3a2A==
Received: from AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11)
 by DU0PR10MB7483.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.15; Wed, 22 Jan
 2025 05:53:55 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:150:cafe::1c) by AM0PR10CA0031.outlook.office365.com
 (2603:10a6:20b:150::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 05:53:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 05:53:55 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 22 Jan
 2025 06:53:55 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 22 Jan 2025 06:53:54 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <aliceryhl@google.com>,
	<daniel.almeida@collabora.com>, <gary@garyguo.net>, <boqun.feng@gmail.com>
Subject: [RFC PATCH] rust: types: extend `Opaque` documentation
Date: Wed, 22 Jan 2025 06:53:47 +0100
Message-ID: <20250122055347.597798-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|DU0PR10MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 18310359-ff77-456a-5ebe-08dd3aa92836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0oT1mRTL6zcliyj5Gx6/Lmj34t9D06XvQgmFYgfJu/tp/wH1S72J7cAyf9Q?=
 =?us-ascii?Q?tMGVqPtsh94/xGyhokDHmRfGkZgrroTD9AAk/JJ5sOArvSQbUXuKzIjmzv7f?=
 =?us-ascii?Q?9xmeUMeXUz4b0KxabBo8dmlXYD2SC3gqDKHlh7fXVJ6UfDkJVdZ40vWQMMn2?=
 =?us-ascii?Q?CyG4VFXszkNAVsZMWvxxmnt6d9ryMKqgfA4H4ESwQTNa+1zpszyT+JbkSHFS?=
 =?us-ascii?Q?o21uaLqLm2T8vEewwqHPp1//Yqb0lpweC19KADITgTSa+P4tjsX79G/U+hPG?=
 =?us-ascii?Q?UDw9jgZ7sJRwA1dYxeWBBZGX+ozD91TDFCEqwhl+5kP95SrAj93Ss6Zpsbiu?=
 =?us-ascii?Q?2Af8Y8lxYcw+tXMpRssyQV9/Q9OF4fck0MBEgIP+lt4Cj2J+J6v9gr8tcMVb?=
 =?us-ascii?Q?yaQPMVonW+CR9rYXlOjEK8b/w/i8qYf/W0s5QzQR/N9ptNJexA2li3zDd5ro?=
 =?us-ascii?Q?TaxkeoPR/zOa0bHIoz0wx0lkwDrbSsq59y4QTMnPuges9atzI6XjlIAxylge?=
 =?us-ascii?Q?GCQlZEL6yX4LAGwv3WqOPeBmtKISwI8VLlqfGbs4vBMMwxyeWBijA1Adugew?=
 =?us-ascii?Q?LCfSSdBBqWeXy7UUP46PLlC7ifJnTpBmHAuOyeaimFNBJXxlUuZqe3rPFyVG?=
 =?us-ascii?Q?4GWTnEYTuDSh0ffOBbP8KBcXvi7FdnNTUzHB4TFbUH+VEabidPhwbXZNK//F?=
 =?us-ascii?Q?dlVPHtpPo7fdK88SkoDg1/LGiQJbSSgEbz3x+8I7PWlIHB5DBl6DZICARrbT?=
 =?us-ascii?Q?oKP0NO/zeo5kDYY4BmACyiZO5SzMUvQOXkcdPTuOeqYp+YzAa4i+XWDAyBrT?=
 =?us-ascii?Q?tvUnjbgeTdF0O7+2M3QfNRcxlNg2LdFkNvM8VUun0tjlAJddiN4olU55I5ms?=
 =?us-ascii?Q?l+gUiMsnGSPNFmSTjL8hZ/IJQrg1KhTec+Sd8g9FDPtcjCUVd2nmIPAGgdgx?=
 =?us-ascii?Q?BenywXybQB63NWgQVAJkWBKQ9Iea2p2Wl2QOMfN8cqTbT0UkuSb3wEsAGAl4?=
 =?us-ascii?Q?LU7h5iOj4qEmpOB8qCHgRrgZE4JKmK39/14G5PIISBZl3MQkct8gn51vkfwv?=
 =?us-ascii?Q?bzNhG7iH0ImI+KneiAnZJ78E+uS/NHiPiRhRI1OiRitE6QRXY50MjA09BBfT?=
 =?us-ascii?Q?otSPXJ5+jalmATkk/6Kpx0YMetSJNu8D6JzXSJTXXw39CFePom1Ava5qELib?=
 =?us-ascii?Q?joPfupJ+LbZRKiMhIGl0SQKl1Zhz2QH7EM6BBYmjMJgGi1UGhGFX8iCh3PDJ?=
 =?us-ascii?Q?npDuTyFwudtGMRJs4hqbcWrtt49Cbby3GiAwxF+soBCPg+qlPqQZh8LX0cZP?=
 =?us-ascii?Q?AcLGJOzw594VpaP43A6DeoKB6uffuY8oQwgj7mrXUE7n7B9dVhxDyLDKU+wU?=
 =?us-ascii?Q?at9vkminh5HpWxUvePKs5DH8s69zRJiHYEqhFoWh37guIaXcVgCSzYprLkmK?=
 =?us-ascii?Q?Q6IJ/2Dr3I63Oya3yoTY2O4Mn3WH++bZpd6f+E4Bmh5JYl3NQrwIUZ2QLMG9?=
 =?us-ascii?Q?kOUDNeOClSUfmg0=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 05:53:55.4233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18310359-ff77-456a-5ebe-08dd3aa92836
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7483

In the discussion linked below some `Opaque` documentation
updates have been proposed. Add them.

Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

---

This is marked as RFC as it mainly takes some statements from
the linked discussion. Let us take this as a starting point
to discuss how we want to extend the `Opaque` documentation.

In that discussion it was mentioned

"Because `Opaque` implies the value may not be initialized,
 it's similar to `MaybeUninit`."

I wonder if we want to add some explanation for the *difference*
between `Opaque` and `MaybeUninit`?
---
 rust/kernel/types.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 994e504ca9075..a2d78a39a9b14 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -244,6 +244,13 @@ fn drop(&mut self) {
 /// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared
 /// with C.
 ///
+/// An `Opaque<T>` means that "this is a blob of bytes and don't touch it". It *might* or
+/// *might not* contain a valid `T`. By dereferencing a raw pointer to the inner value, you
+/// are unsafely asserting that it does in fact contain a valid `T` *right now*. As `T` can
+/// be uninitialized, no meaningful action can be performed when `T` is dropped. This means
+/// the destructor of `Opaque<T>` does *not* run the destructor of `T` as that can't work
+/// on potentially invalid `T` data.
+///
 /// # Examples
 ///
 /// ```
-- 
2.48.0

