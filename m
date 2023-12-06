Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="RscBnk6L"
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DA7D3
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 04:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeO/CDoyWoHvv8dkU9lLkp4bheICwd79/rNK6M6wkY8d4jzdYyucc9O+IMFkycm26xIANwjdcyFJEFyySaurdJEBEezqjmUkT5JOcRgHABEI5MqOs1r065l1+c3mKCz89ziquQxbkdRzkby63ubGdHr4JE1z8O11+58T4kOIB89UoBGdQNpfpTQlqqYzw+y8nHDAjPZZ+SipDG+73H2+aNXCdzN+o7a3vjpbNUYCivzMw3KSjT9ZfbxC8uD94rBYITeC1pfXmo43gyeglV7BNC7UrJ1oQeYGBG4WRKrxVJDHLGY5aD1KZyAV2bxO/qiq3HWmdgGM874/jfCnTiIN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scn1E2/CYcZJu4yGjki91OkaZaWgpijtbAkhCrelkU8=;
 b=Chuzv29Nu254hXz1z9xmFMMDG5TPnQKm0NXLf3pPiAj2XaeP9XfqNqy4vkfA2I/wOJAGd+vnp7SAKKYkoc5hDtVpXAI5ryRvHC33ZQgdKzp+54xEURwFIGyn0OnWEa/F400GASSPZ6Aw9nZva8VC/xiEPmxaKqLcyZlcPiGVDEDZ486cytwFkp8flS2XJaqRfQVzWoE12rjog3jV7EHksrzUSXpp/0KI5NAYB5d4dSadNGCDw7zwBkdRjKz86gPSB8RUQaha5kX143OjgpRYHKOVJAlnB0UuiGtd8LNWBAsUW1aG0YTeHPa6NS40YUPIeTHBTYrrHwf2KJG46V5Exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=bestguesspass action=none header.from=de.bosch.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Scn1E2/CYcZJu4yGjki91OkaZaWgpijtbAkhCrelkU8=;
 b=RscBnk6Ld70Cb0a/AMeAooY5+DfA/VVMDDOQY28OLGoY+omA/oq8A8FnogoKudEb3dsjY+HoR6E2jPcGG+Av3qp/GA8xLqoB8UCQtPvj0DQK/SN/2+gTgEMkVKHKpIt0tKJgeZyCdm+YerhdtXdtKd5xAjbSArvds/JC7ByIlKvIqJQXpe4N7na/a6Zu2P/f5vBkQQPTzYQFdRYaEkK25sFio2ae9d8f0kkSduxmbSxJQZkyGguDeRnAMRL1VCVAsOcz3BZEcW0bmrtoNOtGS8Qm47dAKcWR2GY5k9z5+KEPZRdHQa/WnJ0lHq+6xFSxnywaSVOWJp+a/TGF602J7Q==
Received: from AS9PR06CA0550.eurprd06.prod.outlook.com (2603:10a6:20b:485::11)
 by PAVPR10MB6937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 12:57:45 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::2) by AS9PR06CA0550.outlook.office365.com
 (2603:10a6:20b:485::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19 via Frontend
 Transport; Wed, 6 Dec 2023 12:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 12:57:45 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Dec
 2023 13:57:43 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 13:57:43 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>
Subject: [PATCH] docs: rust: Add rusttest info
Date: Wed, 6 Dec 2023 13:57:36 +0100
Message-ID: <20231206125736.2040066-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|PAVPR10MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: d7af10d8-9b72-4b1e-1a44-08dbf65af117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EMc4FqqSmlvwL8+KqFf2y7QEaDWZpjm9fxCEMyTXtNoe+6uuBt636Y5D4lQJkK0mLjhqotEwVRU414/MGBQ1VXill1rTVd08PIPEBzRhiWX/VXarWII/Lk23I3xPCZBVkEtMrso6WoNxSa0uJf1NvJ5W0IcE+LPMEikChm4t62DckjOAzOjivk9WBoyhU86MG2Ulrjbfoqe03OwGJCCqoJNag/vyXYLvjkmbwOdVNysNTezpQocMyVjeOsLdCHDkeIN5MN0DMHqYl0suK0s2dUcmZHssDDrLZQ4RyvpB71EMvcp/zUyk2ulE1CtHCkVlxYV+ybvlGAM3fuetTV1IMYbrzWfIrjp/uzb837Ny449W0YHkXwGgvuMyyBOUUU/VzukjZwRGd7qNtn35I/3oCxsRv2tZD25oFp+qUzaWwaPPXFlUvU8AhWCTW6RANdTuPdi3oZFUHHsZdfMb7Ggjc0rIwM4eY8OCJciIAFpq0oLSXZMPkiLGcC+6G24JqGzgnS+AVx3ysos9lK9sNc0EJs3KexoXG7EmkVi2J4s4aIS3VcEB/TtqUu4y7tGykKQjY46wX+admyc3uzeohqXl/b7/FTGJ9ZCVNWLy8krQjVtBNTxjv0Aixf6cg/pGadK9oa45MvBf/GhuO3l0mUXxYJQmkBrKWyHwkYTvzT3aB5iaNrdfwbDo2Lr3WFgSPGFoGEdkItXAzJzdoMuY5cTRoWhAV5TiP/Tvafi9fFUMcqIL8MP9BXUe6tIEP+iwvscPyX4SbCs53w93023yG+24XK3AR/AfzywCXkw4eYojoPeXiHTPQPTnxyA6n7AFMAuf
X-Forefront-Antispam-Report:
	CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(81166007)(36860700001)(356005)(40480700001)(7696005)(8936002)(8676002)(86362001)(316002)(478600001)(47076005)(82740400003)(82960400001)(426003)(40460700003)(83380400001)(1076003)(44832011)(41300700001)(107886003)(2616005)(5660300002)(70206006)(6916009)(6666004)(4326008)(16526019)(2906002)(26005)(336012)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 12:57:45.4588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7af10d8-9b72-4b1e-1a44-08dbf65af117
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6937

Searching the Rust kernel documentation all existing Rust Make
targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
rust-analyzer) are explicitly documented with their Make syntax.
While the Make target rusttest is mentioned two times in the
existing documentation, it's Make syntax is not explicitly
documented, yet. Add a test section to document this.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/rust/general-information.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 081397827a7ea..af9812ce11d7b 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -77,3 +77,13 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+Testing
+-------
+
+Running the Rust tests the Make target is::
+
+	make LLVM=1 rusttest
+
+This requires the kernel .config and downloads external repos.
+
-- 
2.28.0

