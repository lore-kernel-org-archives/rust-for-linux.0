Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF839A817;
	Tue, 10 Mar 2026 02:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108723; cv=fail; b=p1qAwxPGq/cY0VqInJu7IhLmANdQakOAlLEeFAAnP3NJKprJ5pAGN7SLi/uk4N3oIqA/cdjvm7gIyVbvh97UUJ/8otU9Tjad6n6TUJBUSZptwrZo+YaRacX3dkbfr2sbwTNi0KK0b/8ns+bCvEBaRUl7MBYHVRgddr7UVwVXQ3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108723; c=relaxed/simple;
	bh=chHd8vhkJWBiQoL9+05yKFqVOR/l4i3QHtG85VExaaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGcCJfkBg6rzPTZ46v7vYWINEdmGqGSRnYyLt6B+vtlwEFOckrECQMNTfDFKDqhSOBGttMQi+yV5VAAIDEKACARO47s5/YcUkZOi4UDLz6KXG0Pa4clVI4U3djnctqA5/YZLqw+8/JiQst5kqFwTidYLKBqC3svOh+zZCnyVzf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ra/AsG4c; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ra/AsG4c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLLc90fd1Amy6mkL81KP7Vfw0TgMxlZiJklkGqlgOrPMgRJ+wwtz6vNic6P1ftU8R/Wt/9eVAkFC5B5QJuvKZUELTJGp1J0KJpbN6oZObE0M+Le1WJ/EPS2LbT7DZ0aaCKMUnd0XgwBk/InGDVlgnMmTYZDc4AWtFSandIJx8D0yd6se4cIxsb67syWhlD2vpSS8nemgBrCN1H8WxxekjEVSuaG3UxMCLjHxGc9fh9voXHxSGrmUkW2dzhWrAWtYU0k7hTJvkF4pHoZKpUK/HrQIk4hNxSOqyNV8EO5MwkG752zxmsTdT8CuzxJRDkOpw2trVaRtynXMRDgWoSOzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWSFptw+KrHK6SX+pbAzDiCnetufWKHjEOO25X3K950=;
 b=L/HTltGA5aEbFuHa+39xWdU6h3rQk1fj/FYLODNUXCsyLsNf8fMXxkq8du0vwb52wp49c7TE6WTw3lIpzZNekEum0kupkAZMOa19OYJ8IwS5Gcnvqb8c6PKX9bLNKMMSMoBEerdrMN+fe32RueVZF8odx6y8uCu02FwonVIMrM/gqQLq6ITsotnjVtvcuP/UQEncLCExmVPDXjz45CgvjutAoOgzucEUOSIqs2dXAcZEhfC+Nncf2S6X7A9qXTPXk00sxaWw48jODjxcdocX76H9pRfC3Pee1Gw/zvurqGWV/V4b2UPfGzmXZe+BcgyQx2rsp1mYNyEZ1xPF1jeo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWSFptw+KrHK6SX+pbAzDiCnetufWKHjEOO25X3K950=;
 b=Ra/AsG4cXoOIy6wlQpK0BjFmN4e4QNW+7qNobBeTtxwQpbeWkdtcJUMMSfqQgblTgLIkztAkQGJabwC7QlMu/vAhVXSEafPAFuxGH8JqAsZPkU/R5rypL3Lih3Jzoz2Q+u8LN0Q4Dc/7dMIDjOK7bPdpTJBaxTGwjv4AlUg+y/OyqWua6JlUvBhFGHAr9noHs+jMwFw1UQRVryJX5eejyX/vfbcdyckTWC427LtC4I9TPW89Sbo4Hz+wJHZPK+F2LWDwzqDufYPf/I1vUV/B1NnLJFR996XiQlq1F+CNGVVz9MG45D+yW7X0Xo0LZ7ZnFmutnjK2R8mmkviHyoeCbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:52 +0000
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
Subject: [PATCH v6 18/34] gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
Date: Mon,  9 Mar 2026 19:11:08 -0700
Message-ID: <20260310021125.117855-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca4925e-17c2-47d9-9045-08de7e4a64e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	tdeZKJTmyEf2Hyo/UD4EUNwL4OuHB7Ng63eOoGlF3JgV2JXiwyTgLqKLMBHhsoubAMStjy+5U2Ip3VMUHMLRpe2o0AoBW+mYc9Hnh4tkR3VVrUpPnokMsk/bfskUN7pd8FrikF+juwhv836DehIpLn7sA/qwnZBBtZJrdVh7T7LpjFlpCTEfLfgU3z0u59G4fMoYQGUbSrOUbviaIMxqGdc/SH2DA6OnNzx289dgFt8E7txUZnQuzNEOwTDc9JVMou4Zb6iIlFUif9dJy5sRVN/wURXiJHycNiOvI5ud0S5mgww1UGT1MaiG3nFXW5DbZDVxjAYxubBRH5jul/LqWh3xaycT6LnufmHfA6rAtTDk0Njq/8El9okjDHn8cYnd9nML+3buaEDGa+lJ54DTIVWE5JDaOUlb4/FGN9xNvNahRC2huSjymvn0l0GYx+tNbSQWPoPBRSGPTqySzq3PQ0056ZqeJ2XiYVCa36UZIhxxg7W/1FEqNnh4e9RCJWPzCpv7wqRAS4vb4JyUzjlQ0b5sRLQD9oOzKPpF3mV8PqF7J2ReQm1MS1IbYgRnUZKM36qXVPcNdIg74myO6f172i0hNxMZWVqUQSEK3hnsnoOtdVkOADTwiWweEcqLpZrNhUPz2UjgZnPnd6aBLB2Wn8v7zKYZfIJyjTiXaiEXelcnnYSHbaB5ka8WgbhEoo+RhSlE80xsY+lVWUOPpg1zlazLYE0wzB5USfBhM7KQo7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A5EdOQeyUqLODT2NWGAiAr3h5iQwsPcMLLgtXutme841Ky8upB9SRmzYhY/W?=
 =?us-ascii?Q?p9q5BqVkFTylAgYasuclnkAITLNX5DryrI4fywupuq5TN6/BCEte4A/rOVe6?=
 =?us-ascii?Q?qeD9iOBqKPEpCyMf7cITVzamuaaPPw7LVz0AVnQoFO6Q70icBE8J/Uk0MqCs?=
 =?us-ascii?Q?zPi412XVGR6V6tcCk8apyKGfEOCx5xs9IL9TXCHLSBAaq2+LHvgecjJLqMcF?=
 =?us-ascii?Q?zqu6reSsY7YbKDUXeUZFm690BjfC/IZrBZPrQw2s0QzYH2mpuNaA4bqKrx4b?=
 =?us-ascii?Q?wgE0cAdC0tVdJjypf1RZJG+pZ49dKLzgrJ183E22eyFKrHnw7oxYeLE2YnKx?=
 =?us-ascii?Q?j8Na3BEUdfuon+gVIlSYl8ygkn4UaBumKBidjtCyMMk7CUj79KkVXOuo+19r?=
 =?us-ascii?Q?qbCieKHk6XF7HwAT8zaz756rHmScfGiJ3oeVosTMyItFlTu8hDtyUIij0kvq?=
 =?us-ascii?Q?XHGBo2l1BKm6l1FPKGJPaIAwa0fwFrn/072MBeSNLXCGQgxBOrjHPMSMTaD3?=
 =?us-ascii?Q?oTl0KIUfVyW0aOrhoqE3/sFtIO0vzL05cKvK2+W2RuKz2j3OESlO2Alot65x?=
 =?us-ascii?Q?hiJf3K9xM0WMl7jVTUymVYD5h9ui0SgPOtT0wbdj9MrlYVBwf9VNEJsrUDHY?=
 =?us-ascii?Q?pK8VzOkpHrwNEO3RW91ojVKN/y6i+JshlPqiU3ygNLTQLqUztY//R/3hgfvI?=
 =?us-ascii?Q?bm0v6EjqWLdWRkM/ucvuhT/fmQ8sZsnEvTwB4/u2nb9c/7cGsnNUYpLW25W/?=
 =?us-ascii?Q?3SGl6upvgpFQfhMnDnLZdiokVzefnW/R7ih0gKtCdbZwZp5jvzNqkgo9geZg?=
 =?us-ascii?Q?wEG7d+valwB33irpJIq5vbSBNmorWAwB1XDF6nK4/u9bHQH3wwkwT885RDrA?=
 =?us-ascii?Q?2UKZSNCl2cjMucb4tFXRoL0G702ZfUStBLd0ocA9MniYj5rf1zuEGjkZpuIU?=
 =?us-ascii?Q?TzRC+WaJiE+dSq1LGUhh6uwwEEziAEumTKKAuHLRW+RQJqmJaTbzQHCOWJIK?=
 =?us-ascii?Q?8bIchuR3FG90AyBbrA3tOtLly0zmE89SmmCAv4ru90k5lx4IW4oESKgGyr71?=
 =?us-ascii?Q?7rba8GzpVHc0k0q5X+PJvWYBRns8ggW74aQm84y2/PTkYrBeoF7nZABe/uwy?=
 =?us-ascii?Q?IY5rQjoXBM1JVwAJhInyeZ69K9FdqC4VnnYYN4S8yF/audu5Z1MZAapFhJF5?=
 =?us-ascii?Q?xOeNeBSxuqpC3IxktFct4XM61o3QXxzSLhSqYtEJhnv5rtwreG09Omjgu9uG?=
 =?us-ascii?Q?ULQT9bQUiO3lhrH2cu1ZlDUHNLDQsCScWNV37djt0qYbUFgiqdJLOgrybyAP?=
 =?us-ascii?Q?Izx8HrYbX/iv00ux0dzOkWABahBBTr2e6P9MJ2En65BDkmjjnpSkiHg2gj6D?=
 =?us-ascii?Q?15EcEbdXOywcwYNQ/5RihbPVqWeMe8hALCt0LS5nJM9qeMHUf7XmvENtVh96?=
 =?us-ascii?Q?Pbnpdto9//O/Eihn2wgs06gB1Lnn3QIdJZF1qtnLDRcyabVcnynXLWtkneJm?=
 =?us-ascii?Q?iZ7vVqGJwyfUS7cSVQGdfHDA0KTZEHUY15Cqvw7ef5xWSASc7a1XikI3UHPU?=
 =?us-ascii?Q?A/EZD92OlsD0C09+2HfrLc8EiwTxZvra+Zd6MNhSs3n/YchMtDtnXxnc6754?=
 =?us-ascii?Q?SMAw75AcQYDKsHnlB1JRteH+N1J9fn6PYdxv0ETsOAT7tnRF6kEamVXwyqgM?=
 =?us-ascii?Q?I29GtOJ1y01YfHrQdS9nH4MCX3mT/ksx6obooUJBG9AcoqnsAp9+6KTqrIpp?=
 =?us-ascii?Q?vVjfgb4yAQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca4925e-17c2-47d9-9045-08de7e4a64e4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:52.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meVGH2hixv/jiQ1MfWh1J7kdvBKraelCzT2ebNMmyTrPDEBUudw0/IUZmrkEijDlG+SXurAhZ8u/hsLH1ClmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 79 ++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       | 48 ++++++++++++++++++
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 4baeee68197b..d68a75a121f0 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -110,7 +110,6 @@ pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
     ///
     /// Data is interpreted as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -131,7 +130,6 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
     ///
     /// Data is stored as little-endian 32-bit words.
     /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
-    #[expect(unused)]
     pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
         if offset % 4 != 0 || data.len() % 4 != 0 {
             return Err(EINVAL);
@@ -147,4 +145,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
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
index f577800db3e3..7c6311cd37bb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -8,6 +8,7 @@
 pub(crate) mod macros;
 
 use kernel::{
+    io::Io,
     prelude::*,
     time, //
 };
@@ -473,6 +474,53 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
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
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100): 0x000200bc
+// - Blackwell (GB202): 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper => Ok(0x000200bc),
+        Architecture::Blackwell => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+#[expect(unused)]
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+// Helper function to read FSP boot completion status from the correct register
+#[expect(unused)]
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Result<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch)?;
+    Ok(bar.read32(addr))
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

