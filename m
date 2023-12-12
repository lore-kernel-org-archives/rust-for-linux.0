Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="J+o/cQ53"
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2059.outbound.protection.outlook.com [40.107.15.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB3FB8
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 00:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvf9Fwa5dWVq+uRVsUsuoHuJ3K7Dknd/J4RkYnIM0zkWVKqDfwZtJH9R29rUHNI/NNJeRIVQy6l44ksZCORuEdjwvjOwL94h8D53R8cp7PEj92vTDQsPQutOAgSi9NLKy4hNfvnCqGxsKlqNomYtuNE+q8sUAT5Zxh7KgmWW0OZPclcj04imQgbXM2FowgW0pnartRfkgKinT9Hcpzk3Mcz/P8BAYL2FNM2GBldYAgI0T6ibBMhgy5t54VSI2+65upDy7ar9MfpGEbH8ZqYWdIqrPUp2k8a4TPevCHSzQOWBap6/Q9B91kd5KAL5sjH6XfIH/KLgEs9q5l2yT4YDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dEwmSLdiC70x5ut+VI10ZNbHf0z+N1vQI5fnkzNXFg=;
 b=LpoCPTmOHebGdPIxQqUTHUGrEz/ScGd23gGmSUwdeOxvUL4NEJl0Em9gVTvk/8C0qeHngO0I0laARRyXj1MXjhnBU16FVx2nlNE4sxvygiAEAZvza7J1DTnUjVbpu/V2zLfj7rOBcBoVZSvmbe0Y74T4xnS/2rcPLMt6u7YAVjQSLHU1qrJCaUnNKi14Tut91/bemDLjfCPFXH4r1AZbqjZUEfzl34tEEdcEBw+C3yhz+NN24cWiISuxc2m4xvIClncr94GtZtqGxuKoGoPXpyNJeo069XduU9Gsvjfxl/nxdoHLDHG3UFzDtvSfFT26tnb7Gh/A4qbxjRLyxITRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=bestguesspass action=none header.from=de.bosch.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dEwmSLdiC70x5ut+VI10ZNbHf0z+N1vQI5fnkzNXFg=;
 b=J+o/cQ53CBTgvT78H/JveP3ijQVWHEZkzvwlWQ1LiJN1SuPj/TI2YuZYl2t7Cx8mHAgfi1v/1WvA+hNLrIzXxHIR9d68HJWN+y5+ZNxkTUXncR7cBQ+jSNRPCWkabWOiRYHKPwdZf0kOsqE60uSdp7pyJhlny/wL7WsxQdm0md1yMqx3T7IpzrwWAYs02eJBIw35yGZClq+xcs2b6nSkIjI0nRB7Nw/QuqRxY9Nv8QbPBrGA/2mIUjTJHCVOxSmrCaa8+fnZTwQlxQtAY1D0FtGyS/YikuW/fjy1S1jnziTgSJ5tWFKj5+LLE4C5YrN4uVITU5rZGGl1bd2kStgiWw==
Received: from AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34)
 by DB4PR10MB6190.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:386::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 08:13:25 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::73) by AM0PR02CA0093.outlook.office365.com
 (2603:10a6:208:154::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Tue, 12 Dec 2023 08:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 08:13:25 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Dec
 2023 09:13:21 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 09:13:20 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, David Gow <davidgow@google.com>
Subject: [PATCH v4] docs: rust: Add rusttest info
Date: Tue, 12 Dec 2023 09:13:13 +0100
Message-ID: <20231212081313.226120-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|DB4PR10MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aeac278-b728-45d8-456a-08dbfaea36d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w7uPi1lqoKIFYesbbj9iwkMPyFp1c81foVvfgo6l0QWkqRgaJqS1gLr6m/6rcbzEQDYErVpbSAHOzwAKS14gWl0+GQNK/Nisgjxju7VeJ8ZMJQGviiKvh/GADhdkXhX61tvONjyE70skrFYaIZfpIdQTvDW7uAH9cZ1tSF4HomTRKlTg9V4UMWNyXbc8hGuiFucwT+JRi7TZE/q5zs8PD+2pksTO7WbXSc8S1nskNQmXtN6OdZyImpPBtvFMwLoPGfA26RfbIjrIS7/jSZxIB4vz8Km0IGoSs9PHT6Gl2iGnzP09lwAXyOHFJhaZ33WqwlYAmixw8PLd1JQeSws09o9dNlLa7WJDPuOTE8kBaYjnNFA/CSUrcAaPeSVQEw/aBm2KhtBe4bjnXlzhYbfLfWOVf5XPbMGijW2i5c2f+ugfK8ksl8zby9ulEkayaPxF/iwFkrPHoqnK5X+1DLMA9DsW1jZvP/m9hInJ0j1UzsCUkQyO1cAVA3hTYIAfHdDHaO3Zp9AQ+lCCOrXuEl6iUKwRuAIYNe+umrvUitt5rzG/QRmfeTxU+tjJQhVfPF83s7V+iTzZxMlU0hqKpMJJBoYOpq09xk3NMTD/f8pJwiACeST6MjyCJv9MwRe/jVkmdRJB/2EP132PKA4FAk6yYf8kKsKj/iJHl8XH+fE/gQUAB1qOkbogTASyUF3Gu4ZLmpAe+5YagDO3hkajuwMUv0fu7fff50ydm1yGGtgN6yVGh6yPH19zfTE3q4pq0bHyY4BQg6HSVi3BMIQ2HpIcvHU4c2eWE6xWVOEzOhEPTPHXeJOvf08vRqUHqBie3JgE
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230273577357003)(230922051799003)(230173577357003)(82310400011)(451199024)(186009)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(26005)(336012)(16526019)(426003)(83380400001)(7696005)(2616005)(1076003)(47076005)(36860700001)(44832011)(5660300002)(4326008)(8936002)(41300700001)(8676002)(2906002)(6666004)(478600001)(316002)(6916009)(54906003)(70206006)(70586007)(86362001)(82740400003)(82960400001)(356005)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 08:13:25.1579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aeac278-b728-45d8-456a-08dbfaea36d6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6190

Searching the Rust kernel documentation all existing Rust Make
targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
rust-analyzer) are explicitly documented with their Make commands.
While the Make target rusttest is mentioned two times in the
existing documentation, it's Make command is not explicitly
documented, yet. Add a test section to document this.

While at it, add some info about the more important KUnit testing
too.

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

v4: Swap the KUnit and make parts to make the more important KUnit
    being the first. Add and optimize the links to the KUnit docs
    and mention the KUnit built-in option. Fix some typos and wording.

    P.S.: In my 6.7.0-rc1 setup "make LLVM=1 rusttest" seems to work.

 Documentation/rust/general-information.rst | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7ea..58283f4894ea0 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,3 +77,26 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+Testing
+-------
+
+There are the tests that come from the examples in the Rust documentation
+and get transformed into KUnit tests. These can be run via KUnit. For example
+via ``kunit_tool`` (``kunit.py``) on the command line::
+
+	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
+
+Alternatively, KUnit can run them as kernel built-in at boot. Refer to
+Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
+and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
+built-in vs. command line testing.
+
+Additionally, there are the ``#[test]`` tests. These can be run using
+``rusttest`` Make target::
+
+	make LLVM=1 rusttest
+
+This requires the kernel .config and downloads external repos. It
+runs the ``#[test]`` tests on the host (currently) and thus is fairly
+limited in what these tests can test.
-- 
2.28.0

