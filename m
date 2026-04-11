Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250231B114;
	Sat, 11 Apr 2026 02:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875833; cv=fail; b=ll0858RyTQnQt8oAKtZ5s2Z7OaXhTC586jf49QgyJu/ItfMS3xbYHauDOYM2uI70G1G3BvotBeZI27NNLlsukO9Y4iJKvGfCWqopIq7z8f6tP796XzocOcPN/gIJ/q7wljnfF6xvkMCRy8xvbPNh1Yg5CdDumN1jkWMoVl50ygQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875833; c=relaxed/simple;
	bh=Qw7ceSy1Kr276gG2Jv6wqu+GT1QTXjFe4SeUt2TzbYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFmSN4i8Dew5jUauI6Vb3Br3SJV9aseLHYC1qMKyjGeKwx2yxat9nnrweR9lY1TjFgY947en8FV7GwAZ8OTTAR50EzUiwaAwoaorNElFQkLrRLJgr+XRBEbRRtw4f95ARiOLG4DhKSESjprutstGOicwYtcrStvHiisza1XeYNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hZYXwlwQ; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hZYXwlwQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYg+qIYsjib6u2SpZiiZnmjkhLHu6yvrNVefREDBIO+7EMK8vlcSA3qmifFNIfvejsJ7Yj9VsBqvQWoStMMQstAoBRdpXgYLNL1neDdoQ6VHcEuD7v2N10R0YaRA4SMjhvMWd4PH1LAXph0KQpEssYECYJDDamnA+Kyazxwy1/79xUpKoGQ9mxmaUdjQFAHF88q1KykK2F/IN6lNKRCN9/q7l2F8WGycf3OoVO3yLUTmNNfttSmKzdkV9q559veZw4KJ0REmv47Vlffw636VyHLkyJ6dlFEOTDxO5hTS2iLhfQnSkdvFPkyMKkbgI+DHkLlwoRtrgWQYQJTROmpvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl5N6tZ2mkOdX6O9XuOouyClWskkF/2mp7EgpDPDuVM=;
 b=LTC1iCaa5CRxgqP/z6TGeDyxbsBMsNCEbizgg9zGWhLRfiXA9rS/OP263ju207dLleMt/CGguWCAo3/xE2H2zgdvN1u9PevA67lQbYxcFn637lR9Fxc6QubcSEML0Mh+mw+EEEin2+8+1mH/+j0uh4b3CuDf1UuT9AljCAau6dkcPuFBm178EfjWvqRgm5NYM63RkFqe8R1qM0vi7xeK4QiYTC7B9TTEgOgNRW66I/NRo9BoCX3/LMOHj2FyLwcmOokvXS9tQhd0RSbTRNQaz0DIeFB8TmgGW6K6HmvZy2E8dKBE92c08XguetI5hwXnPlRSHlLH3INyFG1H2xWw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yl5N6tZ2mkOdX6O9XuOouyClWskkF/2mp7EgpDPDuVM=;
 b=hZYXwlwQEc3eMS8hgLMrShHa7E3bJyIdOP84eTXrIvSH2Yl6dhPPjfRDpIIZtF02BQnBdpBhKYcjQK3PRoFu/CaXreDIGuUnlGFGzS3mc92x502cmsOgVbbJhuxTS0oMSvmPoHFK7T5q5ot8209++JpFES2zmmIHZCQ5NJYuWqk7KaSoII8eMUZLxOqWKJfnYJMvUBr+xarj12r6fUGNxP77HlTZVw3JqrL/dRBJsM3SoF0smHRQfrZR+zYQZQKj6ahUdhLVSJtA+ZDJB+d2pvkUAxMwlvtO+9d3o9xcLcPwsUmZ/IQe+iU6OKmgq+NRdEB1g2m1UnH1YTtkLbwA8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:22 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 20/28] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Fri, 10 Apr 2026 19:49:45 -0700
Message-ID: <20260411024953.473149-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: caccf73a-563c-42cc-621e-08de977512e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cV66FHj5sh7t6DaIxbLWv6/ChgLTTgQbtx7Vcz2AOymnWK1TfutN1fYGfH1Y8LO0ggV1vpQW2DrsyK7UDBpTT1aaHPRQPV8vb/UGrNCqinBeFohApW/4dy9GIrACiwX9p0joNDf485AtEzajh1KcSkq4Ggd2pw/nlNpRbrilnAG0qi76fE7EQpd52uAV45Z4FiWqTsTzgc35CxMBZuwUxoRee5jTrb/iJdNvAcPDZ8Lua/FLRYX+KCTe3wPXPtqXQmJ3RWliavi+7Jao/2l9nJPKyOsep3Ve204p46OXySsuYa+lFEFNk11KTVn841l8ZAaPfQFC26hj/AICe24Lt6Riw5xTu3mfDsfP5iQl08caD8hk70gqFELH9hxc0qd7X9nQWekD/hJoRoeCJKzG4EVN8vDQy2sOY2JCt3LIdLOaPsXyY9dxVZphq8wdtF+chI3J+0avbGTER8hxhhkGjfh7Ymvipc4RWe8AeqQokLxzJGDZeGIxS7Qcbv38yLlYTWRYoM90Pot8AqybL4BlHiZVTJXYvKVF6YmMZj2MQE9oXTUe72xQ2QRA7Jql89nkdc6UP+a9JCBNmjtFNmiiCMGuLq72hauppzn0FQg4UancFpX/qS5PiLlmVFpQhXvLXVT66DvXhuczR6MxT8eDjB73eTE+Ns0TWs2w6S3XRVTtRUT4rodbX8HdMTtryOw6EEH6ZLRIn6X7tXJNTtWZ35QOpTsa64QWSKxX5kF3o2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g+rY/I1TFgXsNZBk3pr5yVH00YmP8nmrOCpPo1CAa0xBcJxO8AyHXL8iRRER?=
 =?us-ascii?Q?6jzbC/S0GzZ4+5msWGPmzf/3wc0yb4Xc7faOQk21sCcbSPuajttOC7VNC4gm?=
 =?us-ascii?Q?1ARcm4n1LBW1LuGSx8eyicpFcDua8Pn6OIbFPR5bq30nsw+9b0Q89DX+9Hh1?=
 =?us-ascii?Q?Ikrz/JnLZrRYh+R8jdRLLsS25xysE10mA9KBlO0SpEy0vYBaoYIm3HaFa0Ce?=
 =?us-ascii?Q?hfRvSKY1cop+rujxPU5QY5031bWlzNaRXYQdN9q3NSoSAiefygDt7X/YfSh1?=
 =?us-ascii?Q?2rDryuAm9tKZboXqAbeM2qV9tPifxMfaoNwxWHbjwuU3necBE1pIqR8M0ZwT?=
 =?us-ascii?Q?DLUKnshMsi/aRKZxSSX5TLkVePNiqIfdZzatNhxwZYSU3TNQieg7Vmz9Ozud?=
 =?us-ascii?Q?OzwMQ7mQgjcBysoJm/B+eqWptIpBM+iofuU8PcbEyt1xkGty44XA4zYfBSVz?=
 =?us-ascii?Q?iC+Jp8yBs5Jr/+i8l2KsrjQS7XySFqcgzFymS3YnkaWO7NsPaEfKer/jkuJz?=
 =?us-ascii?Q?r7xudzHX4mEwp7hyJzPrpVxT88dFrILiO/4AzhEPzZNHpbh0U14CEAe200rZ?=
 =?us-ascii?Q?KiPEKVeZ+MXjVFAefo5593fDO/+Q6udWUoKMpYQhoq2fs3feN8V8Rcr1mB7J?=
 =?us-ascii?Q?XB9FtN1Ki6phDYG6YpnBdBBof3t7NN61xgdAlHcQpElqKEhx/Dmz8xFRJnZb?=
 =?us-ascii?Q?QG/C/9oWS1gwt4H4lO8YzndPABMzS827/BJcYzOvBh7tQ67ivtvewteuBxFb?=
 =?us-ascii?Q?cmRj8DNfKOh9KfzGx6CcOQDg5i+SsAwfdKQ8znSYwR7QklW2hiuNIra3lluS?=
 =?us-ascii?Q?bkF6Sea/DPl9J2RYmCNo1oNw3FBohZEgOkNidtnup0G5ERyBCKFR3w5r+u/g?=
 =?us-ascii?Q?MUNy7tbDUrZ4IIYR4mL0sln8FJgHC4AQH/rEKfZH39sTC6FoGNArkzLSjeo2?=
 =?us-ascii?Q?ZqOTSfWeeRIbTIo+mftv/gehhRctflq9BZa2PYZzqVlOFmcjCcaoYEs7MLPZ?=
 =?us-ascii?Q?hJnK2OV3Ec4hbzg1PegG5s84CDUoKzjRtI387YvUA71c4r2eyzeMkm3iL3aT?=
 =?us-ascii?Q?7diTD5l60e9HmhbFAHQ50VN2DN1DVaOr9SvXBEgG6etYOnlpmUb5v4BLlsWZ?=
 =?us-ascii?Q?tXKFTWHGw438qlFcXr2Vys/2k06H5JdwgbofCKVMo6fBeKAf8W8+eEPeaeca?=
 =?us-ascii?Q?ebfKWLmDbyxhTFNg0+nPbHshxVXW4OMmlTOZGdqAwROCy2ASkDrvS6q8MbHp?=
 =?us-ascii?Q?H8Odf3LTNvInQSAldencoYaWSA25hnkar+CHIDgcgw/aZ3fu2E1p2xDgjswj?=
 =?us-ascii?Q?Q5F4J98MqpqB/sql+TaZdtq0/O62dOfbGBzzKmG8cyt5TNK3ovfyX1X5aEUw?=
 =?us-ascii?Q?GCfkv3uUQRR7rh5LnNhvnZmJWnrQBteZJg17K9FDCBaXLGLm94Pa9s70r4Tf?=
 =?us-ascii?Q?XGge7hh7Q3lakkg1voHiAPpAZHX1NgA2iUXY5wK7ul9rZY3vRBj1StKTkLSv?=
 =?us-ascii?Q?feCL7yjPNdtQg6iToVuYkx2K1BKgegaXa2x6yDVnnmRtKUhhtEptaIz9dhFO?=
 =?us-ascii?Q?DutRmtu98xk4NMikH6PfDVBAFqNDCqsImCkRjNxufAgK+7UA94PX1Z5XBCW0?=
 =?us-ascii?Q?z7VBIiVFSurVJrpRAc+6d8FO671+UCMjfh+q3N8d2C5LfR7HoLEZz+rYJh1y?=
 =?us-ascii?Q?DzX3cJimUgcfqCw4py9UNeDZasuFnqULlnN+0kyy43aRmJKS9KEznnL7er+i?=
 =?us-ascii?Q?JC+Py1EpNA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caccf73a-563c-42cc-621e-08de977512e2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:21.8585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBQ3MZDlCmcYJ/M52Zsg5oKEIYVQe5DlTuiIuoOd7NRtyCyBGDJ57cZJFn/pLs8Tzo6c6VhISAck+p7RRjiG9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 75 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 21 ++++++++
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 27344da6680c..c2f509880c8e 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -126,7 +126,6 @@ fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
     ///
     /// Data is interpreted as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -147,7 +146,6 @@ fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
     ///
     /// Data is stored as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(dead_code)]
     fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -163,4 +161,77 @@ fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular - pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[expect(unused)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
+        let tail = bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        tail.saturating_sub(head) + 4
+    }
+
+    /// Send message to FSP.
+    ///
+    /// Writes a message to FSP EMEM and updates queue pointers to notify FSP.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `packet` - Message data (must be 4-byte aligned in length)
+    ///
+    /// # Returns
+    /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
+    #[expect(unused)]
+    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers - TAIL points at last DWORD written
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(tail_offset));
+        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0));
+
+        Ok(())
+    }
+
+    /// Receive message from FSP.
+    ///
+    /// Reads a message from FSP EMEM and resets queue pointers.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `buffer` - Buffer to receive message data
+    /// * `size` - Size of message to read in bytes (from `poll_msgq`)
+    ///
+    /// # Returns
+    /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
+    #[expect(unused)]
+    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        bar.write_reg(regs::NV_PFSP_MSGQ_TAIL::zeroed().with_address(0));
+        bar.write_reg(regs::NV_PFSP_MSGQ_HEAD::zeroed().with_address(0));
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5ba6c2aedd7e..c3ccae0c235f 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -527,6 +527,27 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+
+register! {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32) @ 0x008f2c00 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32) @ 0x008f2c04 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32) @ 0x008f2c80 {
+        31:0    address => u32;
+    }
+
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32) @ 0x008f2c84 {
+        31:0    address => u32;
+    }
+}
+
 // PTHERM registers
 
 // FSP secure boot completion status register used by FSP to signal boot completion.
-- 
2.53.0

