Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RWj9sagE"
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C944A0
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 19:14:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPW8RUmtE68cirxu2xw2IEBlM4y5fdwdmbWvv7s7ATzKNu/maLRDLNo5ZNX5kPUCVXllRc+VyHw1ycgVwcvJtzY1F2qkIvw+OS9gD3InF6BF8qoGeOxUAQUiCJAtR+C7hVKb5zvT/nNds7CEanj8/3oLyXv/QMZbJvqI/YnOHqcdY6gaUhHZPlzXPvEpzJO5WaLrlgQHRhTBcmEG+INvYX5fSLavwKr0IkWo+93Fzu5JLXY+zj7iNmF2X5hMKF5XVjWIQMvqGBBCa2++tONbNJz7izEWSRiWaJ/YXifanwh7WL2ZEGvw7JlfXMsA0EX0BkuUPeZnJyoxrqcHZysZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqkpxrrKoeu7U5DA1oelakJmf3TGlH7aBT6CGzxZJeg=;
 b=PrVqXI0sFn06byjVs/2UX9ylp3zMDPPQSnx2RY+jCXRYOHtgZ/HWcMgRLbcKSuVk3FP3PcZfS7GCgzsfjDIATNyK1xXIJV8OkdkLrYLRXdJLRf3MMUO3jUzTb7t7y63txm9fqeURBkenhKPxzMHxSiY7GJQlnLC0lFFT4D3O6bFow1Ko//sZBFQTMfNm71B3AJIOb3fhhC/OLtw3iZl+zmO+phA8KQAQ6eVwL5LqeIXGENfuQAUe1PVjks4GlLpMTVYDGCl/4NNZ4i3iGQjzyBFX4McWpnp3d0ccJSxt+473y2Nq1kCKmIdLUQp7c9uIOkoyZSuey08re8sv35kVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=de.bosch.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqkpxrrKoeu7U5DA1oelakJmf3TGlH7aBT6CGzxZJeg=;
 b=RWj9sagEFbIPAy7kTzImFVUeGRW2SaJJkP1D8tSVndj5VvL3dOIFb3SoW/TtBIkp0kbE9TUZ2hqITijoYV9GZyBjGjbM9YGaS10J7evNp0gnVa4Bo9KObLRMwxEUQTvo3wIXEjVESzF8Shsa/gMRBIfdy2budnuDdyT9mkMFhSNE5UgzmKDcrN5HOLOlqj970h3KwYwJwxOeJUWZSRYnGCd8/wrtTkORcUzo6S1vz0vbgoUAELL47d0W7O+x5zDDJdL/Dp1fUkG6vifOwoBXLc0yoED4LovMRW4HWM5Xl6jnmoJ68jQVUo9fDMI46rUHR4K1IcsEZjtD1EZkhmcWew==
Received: from SJ0PR13CA0099.namprd13.prod.outlook.com (2603:10b6:a03:2c5::14)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 03:13:14 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::72) by SJ0PR13CA0099.outlook.office365.com
 (2603:10b6:a03:2c5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.23 via Frontend
 Transport; Tue, 12 Dec 2023 03:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 03:13:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 11 Dec
 2023 19:12:56 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 11 Dec
 2023 19:12:55 -0800
Message-ID: <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com>
Date: Mon, 11 Dec 2023 19:12:55 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
Content-Language: en-US
To: Dirk Behme <dirk.behme@de.bosch.com>, <rust-for-linux@vger.kernel.org>
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f338f2c-61fe-41a2-148f-08dbfac0476d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MNVrE+ISA6HTH8ABSwAyccNqVEc4r4IVRsp9QSV9vLvt5n5RvgGw1bCKYXAsNCy5F3t7na6EN46/gA5ZwOAA0KXKbj1n4w+wkR4BHnEXjMCtGJyGbJFZhkUphT0OdCwqjUZcI3CU65Y/jDtcDDJfpLaGA7zf8gbL6tATex9vppToFODvSrCakBOePLT+Tn4DPRDYjyRKeW1Q2qzBwPW1rTfdSYij4VhpXwNLrWWP4nJ9dayUpzpAHjZmyrxW0UYYSfTjq1wEpMTIjbwUP/lGbTodbpqbfWwwfuNvhRi7lmpwmzqAfGmPzl/RYtEOtOqKBMGJwVyzTrXIgdiXpRn4z/I39gMhaWLxFOF1PXZTqvm7HEdvVGcebl0pLU/YT1csrQMfgPVFF08COjfXZ54ZQQ3pOC7p0bdfyMCZ6FHjhSoQFDE9VojwnREMOPQXKKdDmy25CjGaL79/j2mYmIcTE8ivSvnSUgzzFNV70lmtwaUEUE69qBsCgKFIZe1FhHL303hWz0l9xEijPLGLNudquJZ5AtVG7J093GP4tG1gixmagrHdlvh6eG7ULv4qEk6xNTDz1VukRnt1f6BaEA7V5YMLrXYvnuJuOFiCKhvH70g5orjnTCCw8yJzkfB4jyOAV87uNIT+A+RIbYomL5WYeEqWdimnGMcTfiRKwmz2uh/ZgCQIdFFJOSk4kGCnJrn+20Q/Knnu/BsQWL9xPtL8Q4J6tN+nAfwAmqmpLlXGlclZd/rgLxoAbrE4QfeNKKYCElVFQivR6AYTZlPK+vxSZavK4XADRzBtM8ZEapfY/kTzqJf+a7CRicG/HLNNAmRk
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(41300700001)(31696002)(36860700001)(110136005)(36756003)(86362001)(356005)(82740400003)(2616005)(83380400001)(336012)(426003)(16526019)(26005)(478600001)(53546011)(47076005)(5660300002)(316002)(16576012)(8936002)(70586007)(70206006)(7636003)(8676002)(40480700001)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 03:13:14.0646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f338f2c-61fe-41a2-148f-08dbfac0476d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445

On 12/11/23 04:16, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make syntax.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.
> 
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> 
> v3: Add the comments from Benno and Miguel. Thanks!
> 
>   Documentation/rust/general-information.rst | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
> index 081397827a7ea..016c7feb433ce 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,3 +77,22 @@ configuration:
>   	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>   	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>   	#[cfg(not(CONFIG_X))]  // Disabled
> +
> +Testing
> +-------
> +
> +To run the Rust tests, you can use the following make target::
> +
> +	make LLVM=1 rusttest

"make LLVM=1 <anything>" doesn't work for me, and therefore I suspect it
doesn't work for at least a few other people, as well.

Instead, I have to run "make CC=clang <anything>", which works just
fine.

The docs should consistently reflect this, yes?

> +
> +This requires the kernel .config and downloads external repos. It
> +runs the ``#[test]`` tests on the host (currently) and thus is fairly
> +limited in what these tests can test.
> +
> +Additonally, there are the tests that come from the examples in the
> +Rust documentation and get transformed into KUnit tests. These can be
> +run via KUnit. For example::
> +
> +	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y

Very helpful! Coming mostly from linux-mm, if someone says "run KUnit", I
have to pause and maybe go look it up, but having the command right in
front of me makes it all easy again. :)

Same comment about LLVM=1 vs. CC=clang, though.

> +
> +See the :doc:`KUnit documentation</dev-tools/kunit/index>` for the details how to use it.

Also good.


thanks,
-- 
John Hubbard
NVIDIA

