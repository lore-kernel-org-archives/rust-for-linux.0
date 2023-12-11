Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="g7AL4Gjz"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F4AA7
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 04:16:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZhT4axPs2PcQ0Wh+EnuO+LCg0SydxezBGlJqCBTeejRZDrGrkVWOc+pCakJyDivDpYqpki8zAFHQa39M49cEbwR29V94XWixp/ouLheoc6SY0l+rh2XYJPaJU5WPN6BlzZN6sbOPDcF/pBYawd/woWkbs8gBy6zgmCWm+Qk6rTwcd35wzPXbs9KZfUq4wLiKMm0D9GC8pj2nu5C/B4ncGYLzRLTg9TyNEarO7AdXVYW53k0Nq4yt/hdGbNdrpYrKTwY1a6zvAem9mo5sM3OALvIHE4Irt6plUIOxMcTb53JNOrkec4tRMpRK5lHNNJB/LK1+6MRO+z2zpFeN7GFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijCWKC/WNxxbNNJ2oXTklVs2qlbamMt6r59BSqBfLNo=;
 b=EzlNpgAqNgbHEmbqulNPXGc6MOirVBsSmVndbrcgQ40v8xjHRqHzCVfPivoVeXq3TkZ/PL6aoDHLK5+6y8j3OxpVmnD9TZZjArq23zbBaCBA2ka9/BUaTJYuudspmyB1oSDVeUnbuYbw770l9bmakZUl0dBiT2AipnpD+Ujl7B8XYB3hZDb7EuYrAF8/1cNTx986oW1ukVe5IuSb2pZ+ayaUsAx5tTpjJGQcpEwoFUpRcdqdU7udHrhW/zMeSXlCKCRauWp+o2W1D34Ct9mxfHJDiwlJ+kBvlmR2A+5Eg1T0nlzMcH8CEXJ8ItmT1iB1L1CYSX60NJ730VasMiP7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=bestguesspass action=none header.from=de.bosch.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijCWKC/WNxxbNNJ2oXTklVs2qlbamMt6r59BSqBfLNo=;
 b=g7AL4GjzimCzANlcYiogeb4YS6i5fBVkXKcNZolEaD67BFNaiPmYGG1zr0Qqe9qZ/w55X1Cm4vnt0xBLn3Hm6+cr2+Wogc2YdEgZHRshrr+PbdVzp9Rpkkd/LFt7Qn8eYygtf1gYQRPgggb409WJxWrtVb1x2OrybYcIShoUhei7rMG1nJzQ+T3yAcpKhEiD3EqeuL8c5NKGRyRfB2s+ceoqewSsXZDQaTjzONwqhXlFtIGW2kMDJwwvND70Ony//AU396KOOpJuLjs2fsjtu0N/sE2uliOPZ7PN4w0Evqj19+5yQetIO3xDFRRACkUN+WIIZLP4TYoH7qMqDDNWTw==
Received: from AS4PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::11)
 by DB8PR10MB3691.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 12:16:27 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::2c) by AS4PR09CA0005.outlook.office365.com
 (2603:10a6:20b:5e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Mon, 11 Dec 2023 12:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023 12:16:26 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 11 Dec
 2023 13:16:21 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 13:16:21 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>
Subject: [PATCH v3] docs: rust: Add rusttest info
Date: Mon, 11 Dec 2023 13:16:13 +0100
Message-ID: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DB8PR10MB3691:EE_
X-MS-Office365-Filtering-Correlation-Id: 7126800a-2450-4b57-180d-08dbfa42ffde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tAhhE8ksRxVJGIy+qNOYZ2jO5jSvMOtvVlV0+aesIz4tlp8BNIxii47uvcI/0pP/s7Q2E5xqLauwT4bjnkgC78S7e9Bn0bmkzHa0XhP5cq8F2aAFgQC1kUblaDrCFTmaIJxUEda/jKIOZLwvdkAlbZT6HbDnv4Xi5I9LkhuaAYH0B/EDVvgNgIWm632cKSbh1LKOW5rJ8WTKW7exKlPpkzFQKRXab7TEGUqJqnI1Vu40PjIM/hPF+qaSRVFBddZVboOQzPOQAD6yrI2z+anI2CvE/T2n2JC+P6V2qbfmteUxSJyXwS7nDN2ip5Mhxo9uvcM2Cn5em7m1xQ1XQtZ63jPBuVZ28KfyDpUdoqwadATRirL9CjN5tCju8kjz8EX/RqYmBsuYKSNXtoCMxPxobS0y+JLAD8n3oOF6GwPqKYBvbHpcpa3JlaoBBP9JxBVLkn06vUIwtTDeJa+d8p9gmMhn7w3XnJynb78lCbFjJUSbGzmIksDaxiX5tryHH0YC4/npVESmnsscoxA2WwAEn2Ix+Vmh3hqH5oc3275rSuDarzlLpDXMR81Fc4/Skn5WPzN6BoGJdZk/3sUM/ZuPVXXg7VJnNe7SfUCJbOEZQzyvoYsjPSKmxDrJx5W3XCD3sUCw5IqNTiDaT9GSUllGLHYmKz0VgjkO+R9eMy6uFnor2Sh9EnBgxhLEvNzGZnuNRD9oy1sD5uNnuIM92tiJnqYg24PptehRBtAJoGz4OOcLY7lLBJXb+rZ68jJKYnNqBsNwYcWyFsYOa+xeVN44l9gdYmeuzwnk7gVZjaONkM93z4BT3C2er4OJ4uYRuFHg
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(40460700003)(36860700001)(1076003)(5660300002)(47076005)(26005)(336012)(16526019)(2616005)(107886003)(44832011)(426003)(70586007)(70206006)(6916009)(40480700001)(2906002)(83380400001)(82960400001)(82740400003)(81166007)(41300700001)(356005)(478600001)(7696005)(86362001)(8676002)(8936002)(4326008)(316002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 12:16:26.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7126800a-2450-4b57-180d-08dbfa42ffde
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3691

Searching the Rust kernel documentation all existing Rust Make
targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
rust-analyzer) are explicitly documented with their Make syntax.
While the Make target rusttest is mentioned two times in the
existing documentation, it's Make syntax is not explicitly
documented, yet. Add a test section to document this.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

v3: Add the comments from Benno and Miguel. Thanks!

 Documentation/rust/general-information.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7ea..016c7feb433ce 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,3 +77,22 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+Testing
+-------
+
+To run the Rust tests, you can use the following make target::
+
+	make LLVM=1 rusttest
+
+This requires the kernel .config and downloads external repos. It
+runs the ``#[test]`` tests on the host (currently) and thus is fairly
+limited in what these tests can test.
+
+Additonally, there are the tests that come from the examples in the
+Rust documentation and get transformed into KUnit tests. These can be
+run via KUnit. For example::
+
+	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
+
+See the :doc:`KUnit documentation</dev-tools/kunit/index>` for the details how to use it.
-- 
2.28.0

