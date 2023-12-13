Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L3T6qPvc"
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378E1AF
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 17:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRdrKofskTLszffxYAfueBDVocvUh2OpUU6gN+nzudUGCo8XiiDYY9nSPIUcdWhpnX7JNakRmh5cn5/W8cx5Ds/OlqdRff2kR1OZhsdzONcK2BHbcCgw+ASirV9WdQc7JO20t5cAeLwo6GNdlwqf/iFROeeRheewBHxpA1h3jTrogNILNkgsLD7UVY5RvKpDR+3XHoY8PTwAhKkSrPzYKC/KsrTA0ZX5KJU9sxv6bIh9RLE6MoDgRSC5qvNWtiUaUEfeQaM18r9bND5ON4fuMKJbXFjF2cneSH0wj9xyll6DBOjcG9midNC2wcUO9P0rtVZdTUFEmhdpGDu6LfkaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsV1uYNE4ZF3BOlzYZl7ZouHFLCNMZzhU/FzIxw8o2g=;
 b=e4oB5oaeMoEgRShb3gf7HQq/xukJTHhWJ9CzkEtuT6aNU7YVkHeH50hoxLepo1oIkYfkMdeP+bJIVLljDGWkpOBeVyvENJOxp5GXAZ3m1e0szkQxuSfTGL71d2PKUsS3LH+OkwxvWhK4vjUe8/c0J7ruQsEKgd+7rAr8blhBD716pM+R2oKbklMtQFXxF+LDzmAmsKbmGG3TEyd5k2t7fjqtGDR2y0tBV8QvENVMF0aUIyohMjxWPxaw0NAiaum9qJqYA9A572apd5ADNtWnNs86PWwXOKwTWRWvYR7ob1N/8Qr+r5vG8rYX2mFC+mpvvu6lB9Ach6r5iO+W9FGwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsV1uYNE4ZF3BOlzYZl7ZouHFLCNMZzhU/FzIxw8o2g=;
 b=L3T6qPvc++UbdOdD3MBg+a1VaByf0e4GOigSrvwgh0/IvXEcoB/OTUd+HZ7GjGYA1710qSDP0K5rhBuhtGOzIyXw+Ar6kXzdYgQKQf16Dx+uwvr8iIp3Sq1zIYYIeXACmcasNbA+oNInW2A9Hd4rpbmSx1FNsfMMzXFiWiMAq4CKCgSFW3/yjzm3SWBYqyNpru4P9JowXGrjCm8blIfeeaTc+5UbUSH9PLATNRG/psX8fJgHbpntGJIYBXfhVpw3duyV7xOLYomw6VwGPAgmKb/ybwaVPehNiSeribnx3gKj0mWqCCvoyy5zjzYqSUh1Rf0Ah+KOrtaa1mMsMKadMQ==
Received: from DM6PR02CA0134.namprd02.prod.outlook.com (2603:10b6:5:1b4::36)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 01:44:51 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::5f) by DM6PR02CA0134.outlook.office365.com
 (2603:10b6:5:1b4::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Wed, 13 Dec 2023 01:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 01:44:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 12 Dec
 2023 17:44:38 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 12 Dec
 2023 17:44:38 -0800
Message-ID: <6df6e8e5-8d5b-4d3d-91b5-bc0e90c424ea@nvidia.com>
Date: Tue, 12 Dec 2023 17:44:37 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Dirk Behme <dirk.behme@de.bosch.com>, <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
 <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com>
 <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1f9b7d-114d-42f0-5823-08dbfb7d1934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tiBpobnS71KDtFoR4jbAJ1Z8SONFgOAqqkpG3oH/ferszkytgQmTy7xabyrVQlKr0bXR3K2JQrus6zSdQoc1Com42Fwvz3JvwZmKlqQ3IUzORkdBJw1JDhUWK62B6FROQ+YTXa5SMSwyymRuDhrHLKp6usmHAlRho9b20OQ30hOybBFD9e42LptrItiqbN5F/LDICBQhW/0arK3phtltxkPDCfK2zv6XF3jTiLk5cWW4EpuWJy0i4eyAyrIr3uJK+KiRinVbRpxEVIy5k9zvCjB9na3r5FCdgvdBKJty62e0izIhBN5Qq0+5Pm0TWAblM5CWp1xw2eNK+NjZBTbmpKSujpzY4zNzCSWGrNWIYVhta/Io56zXetJ8V0DGQ7qBEwLYC5v8841bHW0zme0/tlETh8D0MTk4u7N2l9liCuZ/y/LHTzUqndrISpgb3gKiQ0KtrJwi+XJemdlUvtKAl/d8hX6BFj+NCfh2XIoVAURmqb+YdlSsVlJNdRmkXvN+zk8HSt13RxgmcfA8IvB1rPVVxyEwZ9E9J8FAAijcaG5CXaa5hbaqlIP2RBm6GSw4SqKnsGQ62XgeuZ2x/YAb9wQOmik0bSNJspZzu1D21UGiV+vNqGHnP4kuPciQsH0+9n558GNIquQyIB3TgyurdnmjJqc/T7jJB4sh2qW4YZd2BrT3fNsVHxldaVcqBBwCbMCsMYPr17yZ09/Iq+TB0j5MSF7yIZJIZtTXv3FJw8ajYfR6/gK2fX1m7TZeL9ZWKAWk+Q7P/3qKCnmZQYOvVg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(336012)(40460700003)(426003)(16526019)(83380400001)(53546011)(2616005)(47076005)(36860700001)(4326008)(5660300002)(41300700001)(8936002)(2906002)(316002)(26005)(478600001)(8676002)(16576012)(54906003)(6916009)(70586007)(36756003)(82740400003)(86362001)(70206006)(31696002)(7636003)(356005)(40480700001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 01:44:51.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1f9b7d-114d-42f0-5823-08dbfb7d1934
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097

On 12/12/23 04:43, Miguel Ojeda wrote:
> On Tue, Dec 12, 2023 at 4:14 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> "make LLVM=1 <anything>" doesn't work for me, and therefore I suspect it
>> doesn't work for at least a few other people, as well.
>>
>> Instead, I have to run "make CC=clang <anything>", which works just
>> fine.
>>
>> The docs should consistently reflect this, yes?
> 
> No, they should not. `LLVM=1` is the "right" one for all architectures
> (except s390) -- see Documentation/kbuild/llvm.rst.

ah OK. I appear to have been slightly misled by
Documentation/rust/quick-start.rst, which made it seem like CC=clang
was...a thing. This excerpt made me do it:

Building a kernel with a complete LLVM toolchain is the best supported setup
at the moment. That is::

	make LLVM=1

For architectures that do not support a full LLVM toolchain, use::

	make CC=clang


> 
> If `LLVM=1` does not work for you, then that should be fixed. Could
> you please give some details? For instance, is it related to Rust
> (does it work with a `defconfig` build without enabling Rust)? Do you
> have all the LLVM software installed with the right names (see what
> `LLVM=1` expands to)? etc.
> 
> (Cc'ing Nathan)
> 

Probably just a basic failure to fully set up LLVM on my part. I'll
use the bug reporting that Nathan pointed to, if it turns out that
there is anything actually wrong upstream. I just short-circuited
the whole investigation (it's a "quick" start, after all) when I
saw the CC=clang point.

Anyway, I wanted to provide this "how does the documentation look
to a newcomer" feedback, in case it helps.


thanks,
-- 
John Hubbard
NVIDIA

