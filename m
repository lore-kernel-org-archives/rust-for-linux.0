Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4B2EA48F;
	Wed, 25 Mar 2026 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410806; cv=fail; b=GeiltzQ8gOhvIwaaIuGT49jZTF8a3wCRFSquv1wpSIlbVOF5geHKpa/iT6KP7XQt1Ruw4pjV0VZs2++OP09dR1iAjqcOvjenTMlfZZK9Kad9KbC5TfH/9y1QY6iUUx8vsuhPnu0lhe24EWcvB+nwcIYx62a1cqDXnEKn6j86MNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410806; c=relaxed/simple;
	bh=dXR3t0LZJm+jakgskbQFTU1Ve7A/1CgOThuNNlU+C/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jBUX9VSpN6/IlUhHfd3OPEjA44BW7OMUlL8MUERXUZJaI6NGSOKXk8uYJjDfZJ0Y7edsC3PT8p71MudQLWLNYu4U4iMcb6j8RU+NsoVsbJoRDaY4Axgg9WG/i4ec/ZlP+coY7GbZcgyhmVMJIvf2tFgAgdDhoDyy6AmDP53MO2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nkbld4xT; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nkbld4xT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNWu+w6WbcUSGuyxmkr9fvy8m+9bmX2A16ZU+PtAKds0036mNzmuY3dzTKRBF4FoHyXCbinqcvniY2aKDwbmxY8Qx8nID0+diSdlcjF3qie3k4sd4uWTN+UeN+E0kCgIAUhPaMz5NMyQ7EoE+xtqKl6HXsL+30T1iPXeHnRpq1NnDMn++cfLbUGXEuJe4xFRcuryo9xTeG0io0dvHyWqDhPXL7qUAC7Bn1xKTX63EDEw47hPahX90JMDeF3v7zeyOe5qZYs9kbpSFKkzonRQYxEXe0nMG6ogGGXv65yBq3aKhUyQYRdamEMxg3gzyc1LydoMrmpi3/zYcbrosLK3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=W1YoFfUvRopo2Gw02HJZNBRPFXMzM4qVepwyN3B11gLIAM5lbN08LXx+AQzfkCYvFKy9oFhV4PjhsLA3sVbsdNseLmUrFLhsXOsvuhdL/IMgO66J57FWZyV+Juf2Hdb+R+2GCn9vkN+9V34AKaUsob8M2n84x7lmSDBmZosl8gOZqflx0tw3alJo8DfNwSB3SpRtjM5Yb56xU5soYE9yInbqtZvme9myMs6Ms0XngQr8Ufv6qoXqSuoGPlxrNsFfx8j8sQO6d3tKUCp5Q3Qbe7CND9F6RfGNepipDuQ9IfDwOC5TNw+b8+y2xwgwJRnRAPYNUmepwFK9NAmRzT/wLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtt/OKkiOahKRBvb4nHmvsF2sNBRQikoj7/lkRETgBA=;
 b=nkbld4xTaHcjyFO/b9rsq8p7jexhaik7xQIFPH9ett/OfSoswJfr9Pp3Lj7ZYVXrbWU3xFfjXsaBWwQHje5GnfvAX1VXfeVrJY+QMZzewzKe2jSC6w7zXzmoBG91b1vWauMEPXJYnPIwo5RHD1QUFKr169PrFFZtbP9Qhh/FJefMu3GNg0i3HrrBfkDEeaTh+0dwlZzCgEWi+6gebSvD9cfWmgQYLeNiFXy3OLpfsF+hOf3mLB3l+L7wkbXJyUTigStDoiPDQb8hqjPPDOzPSZFt3fJNbtkSWtCK3v0OgLUImKwjPwfAmcoo3MPvkZekya76fotN0niViKYGj7tljg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:03 +0000
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
Subject: [PATCH v8 15/31] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Tue, 24 Mar 2026 20:52:26 -0700
Message-ID: <20260325035242.368661-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: b0915b7d-6184-4dd8-696f-08de8a220422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0zwrxCz++B+ODYolqBYXwjBh35Fxo3IHsdIalI/xYzYTVA5gSJpBeFqRNp7UgbNV/MnBQWReivtOWOphgU3iBgFoHBFf5lp/81pi9Nymbw75O3Jxw8ZzfUuX6svb+BX1rLdEpQSYANLww9oOAZmba5A8UYZXYF+xUnwEgMxt1ZOqXhEUzT80f7LW+pkgv3GcPaYKekBePvmKrGFKsFpqha/Ti8N1XDO68h+vanGf5u7J2637cWP0la3/hKdWyW6v3gyLk1jqAisH2Z5HwHo6CSmtr7ZK8Pn7RW10DnnJ95nUYLP+cb1vqWO5TxbFS+BH25wnRH1wqrNAkhJG4LSpocKHYnsRgSGgNBMJv7i668eU324Uc/xQsjayTZTeM7vomLvVjAvNsPn9sOTVQo8+WgMcx/4XO27k5/jFZxgLg6PTMPdzygXgxLZYJ+CunoO8zESL7LIHFS8QgPZYOyjrGY+XoSwILmiqV1Os8earfsk8rfFolWRt6wIi1DuAyf+lvhz17ic4hwfSDJtVb2kd7/Qv6cGwOs1KzREjlt7tBQtraPzZyhVv54pdSdT6aNZg6krqzZggouykx7mKJC24/fCuOFpbA8/YAiWd1Oc45go/hmb5ar8tb7dEwW57JKcr+S4Wh5i1afTwxZKX6LnN6Y237XQ5scRum7Dkl8SFVa31B4Wt5UOhUkK9D4NOhdhqTS7D0qOycOZDANheF3DSIuf6G+Wvk9zOpW1NxnpfjAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q/Y6bSWtbgwyYmTDtIgMMLfb1NQvCfVW/EdcW/hieEueyF1JNxQunkNRvT/R?=
 =?us-ascii?Q?NNK8YpRqAFCfs52UXDUC4iuDIlNJnnPFZNm6jysQlESNa7+94Xe1zho4Q1FQ?=
 =?us-ascii?Q?erACEjiAHzIzaF/Hl4ZzdPlmzVCAjdNyy5aggt/IJzW/kaVz3Y+M5VIodE/6?=
 =?us-ascii?Q?arHEltgNCUijYdCHSRE9D63RDJCXYDn0GgccMPLK20WiChmII/AHGpRKA8Pv?=
 =?us-ascii?Q?mqunh1zw63/558H/uSpkpB7fAl9fzXp0F3FhTdYQ2IMLMGjk7bfwWsRY4GkU?=
 =?us-ascii?Q?ZBdLoe5+L5fipG40gYJ/Ka2T5MN5a2z7HO3vu291TnxYTKjXINf63wAeqbBk?=
 =?us-ascii?Q?BCCTWn3oYWMRBA/KYQ9Cf+md9ggJjOZm/bR4uax5TlYiTOAFtZlOXNfsyvOC?=
 =?us-ascii?Q?kRyXE4Xv6H73MBHcuCi3JDZis2dFtTidIPJYSS1TSCEeCQzbrgOzHe1IzDn0?=
 =?us-ascii?Q?vQLc7PKJ2UVjDIs6rSOSUrvwdSoHgBq/tmZOmq9mgttjQsJbJkkaCqjtnRho?=
 =?us-ascii?Q?jGZzcj9uo869b8V3+oZ4NnHgrBOzF6/B0YNDh9WArFp7vYKaZb/M/0avgFeU?=
 =?us-ascii?Q?l8Yxdv3kIQXad+mHg/5WBEfUT8W+ceDKA0nuFD/JncxwZk9NeJEgq21NjTKX?=
 =?us-ascii?Q?k+hJYkA9WNaTvVynN0Ii0vCtWdmHUZueY3MSKQd4i7D0pvq1wnVXxqi8sdDW?=
 =?us-ascii?Q?WqYSwidl7au3TG1edjuKBJlpD3k77H7OosCaYs/X6LDbAra23iLz+Vjx2Of7?=
 =?us-ascii?Q?/kehYQXK6MplTsNkZbLsqiDOMoPdHkbPYXJmuQqAKEqCcd4U5DeB+DXUoYgu?=
 =?us-ascii?Q?M89KFoHLEQSRgPCuVSiNrwNSwchgd3QQ6si82h/iIThB9fRfmD+TXxl09yhc?=
 =?us-ascii?Q?Gt/Dhqksf9ZbtXSs7vja7lOXho030WN6/hioduQt0jI6JWDeDNFtoq2yMbhS?=
 =?us-ascii?Q?MxHyzEpvr8xu04fR+KNqnjOHi6kCwNKnJzFmJRPPLNcb0KhekutdtC/fcx3Y?=
 =?us-ascii?Q?QZ3lUcB8LR287y3+Th/RNjrheDJtECxnovdxdTldnGRLm8dFg8GCIzV7jRKW?=
 =?us-ascii?Q?8QsciKtrEv8xLjH9ukA9/SVFJd0c82j0qtnWbssdxIUouY4uz7kQke+fhKzB?=
 =?us-ascii?Q?4Wmk/+i1iSTK5AHtA2muK9PIQQ/SiQjA2S+MakGMXvTfv0U6RGnGwtwIaTaC?=
 =?us-ascii?Q?+ACtM+M5HybZsZ3bsgZAp6BcgOKxx8+8gVKlcuoT+HIBrNI74j5qtxPy9hEt?=
 =?us-ascii?Q?2LI4PKJ6zxJfzzMELvLizJW0aq+SbPM7xtFueWFeMO7fKpwjNxvsecCjdMGj?=
 =?us-ascii?Q?jQiqTqL2SXIOyTJwlWyVqa54md6RCNlh8XiFpGbIZwS4ekzCOWwbA8gdAgjU?=
 =?us-ascii?Q?rf50ljI4osyg9B4M/t5v1kgmBNKg0uTwUwXE8+sDfn6vconNiPEc/+mUqnQO?=
 =?us-ascii?Q?xIittQe7is+k1WrP3jEvzoD93IU3evSSYAcsECPYw/yLw7R3Sdduq3wIszMH?=
 =?us-ascii?Q?FidPEanwpfpdxdKldV+eQeeCfg0ivRjzVfyCZHJwKdaDfaCG+FHpeeynewFR?=
 =?us-ascii?Q?uZJQi5r6z61KGbhVHbzUtWluFWckn/wHleThLfKxEW3XPF4WuhtS8VzU4yuO?=
 =?us-ascii?Q?9mYKHlw1tqDfe231UuhyWFQuUgIz0R/jWsMjf8tIhez51rFPnCQEo4OYjesi?=
 =?us-ascii?Q?pZpEhqPLnyT7vMQpokHRYIOcnDjzn22CUnU9ViVdMb8x+S/yi00yX1+2K5z7?=
 =?us-ascii?Q?fSQZdwPnWg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0915b7d-6184-4dd8-696f-08de8a220422
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:03.7562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHaZPJhOm6HR3R9dgTQSaY5fMuQgtgetpS69F4uTkO5kEwSc9fJIAFLMtvDrlhw2YsAundYHeJHQSPDHKBPC2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 18 +++++++
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 29a68d6934a9..faf923246ae9 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -108,7 +108,6 @@ pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
     ///
     /// Data is interpreted as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -129,7 +128,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     ///
     /// Data is stored as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -145,4 +143,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
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
+        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
+        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
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
+        regs::NV_PFSP_QUEUE_TAIL::default()
+            .set_address(tail_offset)
+            .write(bar);
+        regs::NV_PFSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
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
+        regs::NV_PFSP_MSGQ_TAIL::default().set_address(0).write(bar);
+        regs::NV_PFSP_MSGQ_HEAD::default().set_address(0).write(bar);
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index f577800db3e3..686556bb9f38 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -473,6 +473,24 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     31:0    data as u32;        // EMEM data register
 });
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+register!(NV_PFSP_QUEUE_HEAD @ 0x008f2c00 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_QUEUE_TAIL @ 0x008f2c04 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_HEAD @ 0x008f2c80 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_TAIL @ 0x008f2c84 {
+    31:0    address as u32;
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

