Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438A1DDD6
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Nov 2023 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="rjHIW6tR"
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C04D6E
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Nov 2023 05:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfnwK+MEzHJEkWHsdpjw1K7r9+Jez0qHK7tNC+2avv9j3MlkQ+J5P2sKT6aTfIqON064ZKs5UMIEc1MBk/dH3qwy4dcA9i3qfvW/9WOzjkd5vLApkcf0SsG+O8FFytKD7uu2IPJXChp7EVLJB+uGwfAZgmjNE17fee1P9qmUMBegoCSjcMCd6pHnZoSuGK7zomVGJ+Ox5pPwER/W9LtzBQ9z7NDp2jZSLPxNLy2Koa3PqkuSt5T49Tx9EUSIwJblz178mChVeKi9uKDKrN+ini/4z6LmLMldHdnSu+w22ifx+L+GAOdu8dJjRiKBFikAiToFvrBK9IZNxmr3d7aADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKXME07JPzmnY1JbzKa2ih06U696/80eMSb/z56bBaw=;
 b=Drse7rvMV5wbbzvcxx44lE3AO7r+aGRuNilYe9tKIutxW/k31t8XXrcnKVZZ2oL1epdpltAGoYzcG23KIfJGoxGt6oy3W41GpUydzuDSMaJTm8bfS0VRS20p++bhznw87+N8GX+6zVpJnea4l55PlJPbjS6WYCjLRq8GS+m3QZdoWFWcz2bW6DuKJMN8Q+JzE/HZbcHXba0+PDBYVz9r2+S1YrW1cnuStKDC780LIeZTu9B/xgLwW6BMIcy+tFaQRa0ZOhfW6NlK0Vq+5u4j6Gap4jzlacokBVNoNbR1tamaLx7P0WxziM8rg9opoR+tHJWtBUFyOOIlC+O1mTm2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKXME07JPzmnY1JbzKa2ih06U696/80eMSb/z56bBaw=;
 b=rjHIW6tRIg9nr3+7jRKNCXg3C+5dFjYFn8Yn11yAIF+VIejwlS++Ca6qvKa3TChNdpZTgQxOWFjNRBRjbn+HzDPEn/WWygUY8v4QI7B8x6F+i0FrqZB6u1Oic8Q9ERKUpusuYusEN69efccV0bEY+93Q9BDQUJhwxPNYjjQ4zhCVW58QfUzR2iC7gwL6ZlvUhq8X7v9wjs1LVVnN1BVTJbQpcNE5WwQdhiEUw/aDbGICfGBUGkCUgDng0mOp8eIlIrsJwYRIaNCDsqkoqSYL4dSE+Kgm8qBY7waXs5OVK4XbGfWWDTTRKY+3sSWtswNaScGSC+0u5ivYlWnMJ6QLcQ==
Received: from DB8PR06CA0034.eurprd06.prod.outlook.com (2603:10a6:10:100::47)
 by PA4PR10MB5564.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:261::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:07:08 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::9) by DB8PR06CA0034.outlook.office365.com
 (2603:10a6:10:100::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Mon, 13 Nov 2023 13:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.199) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 13:07:07 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 13 Nov
 2023 14:07:01 +0100
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.34; Mon, 13 Nov
 2023 14:07:01 +0100
Message-ID: <104f983a-57c1-ff94-607b-3a48d2e225f4@de.bosch.com>
Date: Mon, 13 Nov 2023 14:06:49 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Subject: Usage of experimental/sample bindings?
CC: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B91:EE_|PA4PR10MB5564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dea60c3-f71a-4cf3-f3e4-08dbe44970d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y6mMZuNN5O1ygvEs/1QnefQ4HijQbR1uq+2xzXILMvb/p+2MKzHR6h1NouOEC7oB9EFs3Ht7uLl2pgXBhskvjRrYqD49fYVpkl2VVoVIn5AenFU8esZ9/GD+f1tqEZG0VI6x7aUXnml23YZYOJfKimGyKN+rv+2K2thi650qWURtKmePiISL3ilJz2+v6xvgGsSWc3OpxyFNYN03pVEVNdoMFLkLqEdVksXF/oL22RcFNS1r/P+9zVkWNZU1Mjk44u/m0WmBAStHQAvd2Sh5dQN2EKmF2UaXgBXbdCNR8dOCDTNqgmIUYcQH4kX4HolAy1mamQl3iiOMNcZHRoTe4o+2gC635fzx1234270WCbRo+5L3JaNI5SaZfPPjlSOFoc96wWtvB+MPdO1W+RDc4gOVOheChPDvqZXnp1qvAHB8RQrnR+9ba4CWdXd7o7wrg734t01lHENX4EoqtfiojFZ363YqbOHV5q9XEqEwQ76boi+P9uv0ezRdXVR64h384N91Viru+9g7fzmxLQeQu35mAtM5KBfkNJweBe5ZuneYHX6YGTDS8cwkkmHQb2715O0vJkl4FzMHuB0q94B7Wlx4KX9b7omSLoB+dZCjTcLxEqVWH65Qni/LIqyIl1IcIwcXZqLgVsOoCDi/YRFeulm5/1x0HyWOTCbjLA87lBAZs55Elg4n1tbyKUqv74mPVCynelGdkAkQhn0V6/yOqFpSVTSiUoTcvoqS5zmR7nWsdfyIQg6xm6/7NTJv/sLotrr0UjYXTVTybIxjfErIQBOOf3Tm6JH36DdXBvWKcFcdcyvo6Zwf4H2/YUj4oAHZNKu7+gN7jGy8UpYaMw3kXw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(966005)(478600001)(81166007)(6666004)(356005)(336012)(426003)(107886003)(47076005)(16576012)(6916009)(316002)(70206006)(70586007)(31686004)(41300700001)(40480700001)(83380400001)(3480700007)(31696002)(4326008)(8676002)(8936002)(40460700003)(5660300002)(16526019)(2616005)(82740400003)(86362001)(82960400001)(2906002)(26005)(36860700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:07:07.8975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dea60c3-f71a-4cf3-f3e4-08dbe44970d8
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5564

Hi,

some month back at kernel 6.3 times I started to learn/experiment with 
Rust for Linux kernel. For this I used what is in

https://github.com/Rust-for-Linux/linux/tree/rust

That branch has an extensive rust/bindings/bindings_helper.h and several 
nice examples in samples/rust.

For example, with this I was able to get something like

https://www.jackos.io/rust-kernel/rust-for-linux.html#adding-the-rust-module

to work for me. Fine :)

Now, re-starting this learning activity I wanted to switch to recent 
kernel, i.e. 6.6.

Unfortunately, I found above Rust-for-Linux rust branch with all the 
nice examples and extensive binding helper stuck at kernel 6.3 level.

Taking instead the Rust-for-Linux rust-dev branch [1] which is on kernel 
6.6 level I found the bindings_helper.h and the examples being quite 
limited. What for example results in my example module to fail building [2].

Have I missed anything? Is there anywhere a "latest and greatest" 
bindings collection which can be used for experimenting/learning on 
recent kernel 6.6/6.7 level? Or what is the idea for such use cases with 
mainline kernel having only a quite limited number of available bindings?

Many thanks :)

Dirk


[1] https://github.com/Rust-for-Linux/linux/tree/rust-dev

[2]

error[E0432]: unresolved import `kernel::file`
  --> samples/rust/rust_vdev.rs:3:13
   |
3 | use kernel::file::{File, Operations};
   |             ^^^^ could not find `file` in `kernel`

error[E0432]: unresolved import `kernel::miscdev`
  --> samples/rust/rust_vdev.rs:4:14
   |
4 | use kernel::{miscdev, Module};
   |              ^^^^^^^ no `miscdev` in the root

error[E0432]: unresolved import `kernel::io_buffer`
  --> samples/rust/rust_vdev.rs:5:13
   |
5 | use kernel::io_buffer::{IoBufferReader, IoBufferWriter};
   |             ^^^^^^^^^ could not find `io_buffer` in `kernel`

error[E0432]: unresolved import `kernel::sync::smutex`
  --> samples/rust/rust_vdev.rs:6:19
   |
6 | use kernel::sync::smutex::Mutex;
   |                   ^^^^^^ could not find `smutex` in `sync`





