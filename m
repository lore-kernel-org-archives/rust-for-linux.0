Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2060.outbound.protection.outlook.com [40.107.103.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD614D28C
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721724911; cv=fail; b=F1UMk7yeFqkfqJ0b88NB/jqfBPEXcYM6dXwbf0y4coNg97wTjdKWPMEOtHNf7+qxTvA7eqnHVAHrQ6MsegeNPqTQBknMHKITE5y2efmUvihzgQRj4w+ZZHAyViUBpILvBEL657P54MqUi1y+8MI8MyouznGi+EXVzrnhI5PpF6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721724911; c=relaxed/simple;
	bh=R29jyIXTiVyL1XIzRhTUjTKIxyQdNm6xy4saxq13WY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j9IcWdVtmCZ993JEYIdAlP8rjzXBIPQVeCeJZuIh323ZnrZietCWWQJNS+2jzY/8rhZ3pODtqxN26t5jRplOX4/WSFBf9OCaUQVaHqQtulWWI0nNOFWmOQdrqc2Jj2rfId/x00vg1T9cwL1VB5KUPC6bad/5BiJ8TczGHhpNbAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=rrrbj5jG; arc=fail smtp.client-ip=40.107.103.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="rrrbj5jG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHM3lLIATfCFUG+4XqMu3Aki3xPgV8CurYRk1mUmPvKsNDhkMZ6EuTifGal470edXe9JAkerjdIC44nQtbfwkDUhdOJtiVu2YTHWJzr7NDJTbm8LIys1vrPTFETV2pcmz37KNeB8MamABMeGPU0UBNYJquiYCMDhPUpf+FOzitla9NATNs7oRqNWuwf7+l/9EhZgcxhP0Oet80EVhJvrCqOuFBjHdPDxWcoR1bU6v2lgYRJlfb1vKC64H+bA1ivpE80MEAAZASMHVMrLP/YVOxQMuaYRP/kozqncjHRqh2gSe9bndU158sG1kbT7sylCBwBw0+rZYgMfS1Vbge+V5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7OCcXvIrutBun+mvtYKxT6xjKUFIdz+hRejomERheE=;
 b=EXVjqwLjwIQEOA7xZPGx+pa+P/2lBe9jbejgY1UuEw4vWMwsiq1weJLDaOHUWmey+Z3IS8ylSVbOz467qjw0qwAxnEKzkQoX+ux90N8g86YepLWB7aetc1u3CG/HBCyIAMR4HWHTJMBQNDIRYiEzFk1fiOswptitEJlSrzMIwDwl+re9jGuk2LajO4+nF3fLRf7A5LuptMjvlHlJA7G+d1KClW8EpRQSg0l+axpGpTEn9x8vSVE7TshixyK0YQeTvRS5AwIz4SprKjxROPhg+oxWj153dv9E+dJDgszTsD4J/yakUN/Ol2MkVaw7Go6jAyPCipYWlgypezxPd0BY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=temperror action=none header.from=de.bosch.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7OCcXvIrutBun+mvtYKxT6xjKUFIdz+hRejomERheE=;
 b=rrrbj5jGTDo2MMqWpNinuEQJ+fJatkhTl9hmSBGg1ekvly6Iwj6nvI9SdM1tmGv6vA1BEY9mU1JwaQKAaSceNa13DHUodQBRXAUxaXTrsJqAmqB4trzxWfufG74EnN4Dr4WAsfAuRYKesQ2uxJHCe95oCJXgRn/udpRDOFuhaVgnv8aYx48jvYYwzqh7aaa5/pFWTa/a0n2oDqW3wBAu5uSoSU36uW6Ac5z8KQ9UzW/mKM+2eS8yDmMimGmB5NClEZ5S4cpoZTSva90K/3lgh+fVCl6cUW8mKvEpHxbwtZ6Tcsn1uL1+IX3lSR8Di0tXRlq/3hGmiWYOYyOoHe0j4A==
Received: from DU2PR04CA0214.eurprd04.prod.outlook.com (2603:10a6:10:2b1::9)
 by AS5PR10MB8101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:672::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 08:55:03 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::cb) by DU2PR04CA0214.outlook.office365.com
 (2603:10a6:10:2b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Tue, 23 Jul 2024 08:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=de.bosch.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of de.bosch.com: DNS Timeout)
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 08:55:01 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 23 Jul
 2024 10:55:01 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 23 Jul
 2024 10:55:00 +0200
Message-ID: <b5e9c551-589f-4f2a-9e38-a98a4acf4c35@de.bosch.com>
Date: Tue, 23 Jul 2024 10:54:53 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Support latest version of `rust-anayzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>
CC: Sarthak Singh <ss269@uw.edu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
	<rust-for-linux@vger.kernel.org>
References: <20240719080709.1804899-1-ss269@uw.edu>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240719080709.1804899-1-ss269@uw.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|AS5PR10MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 141d9a87-43a2-4885-050f-08dcaaf5235c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekNCVTROTG83MDRSblZxNXJMM0JUdnB4VHFSTGtZWndEOWZ3cVY4SmZwNkRT?=
 =?utf-8?B?aiswMndPNGltbm1iYUsrU2J2dHMvQWt6SVNXQmV3b201UXJzR1pXL05Kcy9S?=
 =?utf-8?B?UDc1RVorNGdkQ0hxZGNOS1dNK1Bzcmd5MTZsSDE0SStzUXljOUU3UXJhcFpw?=
 =?utf-8?B?Y3BWdzAwK3dJcHVIMTR3MGsyamFtUFE4RXpYcE9VeGk0MW1ITWtOUmRFcmVC?=
 =?utf-8?B?b3ZTbWJXRG5jWjI4Q0h5Tm1wS25GV0t1U0xOQ0ZtM0dtbnVDMHBUN0tIbDZq?=
 =?utf-8?B?bkROd2J0NHRqU3BHVU5rOTd2MkI4Q2krbjFCV0poUGI2RE5vSDgwOHdqUW9B?=
 =?utf-8?B?N0E5VWFCMVY2b2pBR2k0UVJVVC9FVGZVeFF3cFhMR0xvcWlERVczN3Awd3k5?=
 =?utf-8?B?aENDQUI4bmhWSnpEMk03U1F5UzJNbFNYWUpCSUZXZzBQZGVGbTNxWFJWeU5i?=
 =?utf-8?B?SUs1UTdDc1VUQUtEOFRteVc3RjYyWW5lWFV2TVNCN3lLYkl6MnpwNTlqZmV2?=
 =?utf-8?B?d1hYc3hyaXpjYkJVbGNnNVI3YmJJTUR0YkpxUStjeUUreG5sQlIxNkp6ZFZB?=
 =?utf-8?B?dUg3WWxGY2tNaWFndElzTWZEUXI2Sys2UUM4MXJKeWdsREVWRlBiRml0aVUw?=
 =?utf-8?B?VGUwZFVJQ2lHTkJOMjlJeGRVTmVKaTRKa3NuWGZDUTRqR2RWcGQ2a09MSWNy?=
 =?utf-8?B?cmgzOVNlVXc0TTkzblNiemJoTDd0ZlpjdzRHVDlXRG5sTnBYaEVUK0lzeFUz?=
 =?utf-8?B?U3pJeXIxMkJGb0o2VlFpUEhqZmJ2WFFZdHdFSkhEUE9IcVhiMzZJd3NhYVFq?=
 =?utf-8?B?TmxmQkQ1UG1lZmVOK2JBS3Z1aDRpRUloM0lnRFFoOS9oanNTOE0zSWJPYW9n?=
 =?utf-8?B?WXZkQ3VqWW9tWDZzZmpnQUYvR1N6TkVncm1BNTZnTzgrcFgyUmNXaHRZUjZS?=
 =?utf-8?B?T2VaZ1NialNKVkJUWnFzYXhlaWNDTTFkb240Zm9Pd2hLUFFDakhVNkk3ekE1?=
 =?utf-8?B?by9HM2JnQzQwYTJFbTA1dlN3UXNuSEkweTB5VXVZaWF1MHBCRDBxM3I3WnEv?=
 =?utf-8?B?d2o2cmhSNWdqZkNhamtCNWRhY05SRFAwQWJRWTBiWXRUZnNKZW1GRU5hUGNp?=
 =?utf-8?B?Z2lxcFE3NkhZRC80NXdGVUcwdk5ST2k2cG5uTXZUczlhK252cEt6YXFXYmpa?=
 =?utf-8?B?dE1jQ2NySWExUTV1RVY2d3YrZXl0bE90Nm5UZG5taFFPekczVFNjTzI3ZXpH?=
 =?utf-8?B?V2JRZjJFczJGTlI0RzBMaUk3UzBZMDI5RGU0NTEwUXFBaGd4RnV3MmpOYkVS?=
 =?utf-8?B?Zk40VzdLMWFKTmw0NHBtSkF5bkJGTDNacGR5cE9wdGxGUUZLV0tBbkdKMWdM?=
 =?utf-8?B?dlUreUVIbktTSVlFb2ZFcXU2eVFQRllMLzVPaFYxVENGcEsyTTBjRC9zUzBk?=
 =?utf-8?B?RGxkcnUvRWs3UHUvRk9sTE9MWm0xeG9zb2lSdHdaMnZNcFZPeUc4cTVCYUZS?=
 =?utf-8?B?azhlSjM3UnFIQVY5UytnYUxSM25Ca3cvVkNCWWQ2YkdCVXpGWElNMnVMZTNF?=
 =?utf-8?B?bnpxUU5qcHRhaEdiblBKL2FLK2lJSjVjN2Evc2xsTUdETW01NW8rOFRjWisy?=
 =?utf-8?B?QmpaT011UENlcWNDT3RvVE0vaDc3NTdjeUpuc3BXYmJ1Nk1VTlNYcEtuMFZ0?=
 =?utf-8?B?L2h3cU1hZjdEb2ZjZzhjWFM3eEs0SHF4OWhWMGNVRWZZeVZHS0ZpTlFQNHBv?=
 =?utf-8?B?TzYySFJyTXFObnRkNDlUTGhhaU5pcVIyTWY3VW5VQkEra1pOdDdqL1NQbnY3?=
 =?utf-8?B?Z2d5b1N6emFaTmpoSGUvd3VJWU0wSC85WHZGcThZZDEyNVJydEFuR1JUcGI4?=
 =?utf-8?B?d0UvaDEwOUNyNHZUeXVTOXFlemF0ZER2YzVyYVNjRzBGbzRWR1l5eXJGM0xi?=
 =?utf-8?Q?UynO2xzVFVw5jMG5gBePwm8BSubcaFKl?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 08:55:01.5772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141d9a87-43a2-4885-050f-08dcaaf5235c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8101

On 19.07.2024 10:07, Sarthak Singh wrote:
> Sets the `sysroot` field in rust-project.json which is now needed in
> newer versions of rust-anaylzer instead of the `sysroot_src` field.

Here and in the subject there are typos in 'analyzer';)

subject: rust-anayzer -> rust-analyzer

here: rust-anaylzer -> rust-analyzer

> `sysroot` over `sysroot_src` has been working since rust 1.74.0 (which
> was released on Nov 16, 2023). Since we are going to target rust 1.78.0
> going forward we should set `sysroot` to support all currently used and
> future versions of rust-analyzer.
> 
> Code editors like VS Code try to use the latest version of rust-analyzer
> (which is updated every week) instead of the version of rust-analyzer
> that comes with the rustup toolchain (which is updated every six weeks
> along with the rust version).
> 
> Without this change rust-analyzer is breaking for anyone using VS Code.
> 
> Signed-off-by: Sarthak Singh <ss269@uw.edu>

I don't understand much of this, but having rust-analyzer reporting an 
error about sysroot something in VS Code without this what is gone with 
this change, let me add my

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks

Dirk


> ---
>   rust/Makefile                     | 2 +-
>   scripts/generate_rust_analyzer.py | 6 +++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index bf05e65365da..e3d0ba099b18 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -350,7 +350,7 @@ rust-analyzer:
>   	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
>   		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
>   		$(realpath $(srctree)) $(realpath $(objtree)) \
> -		$(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
> +		$(rustc_sysroot) $(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
>   		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
>   
>   redirect-intrinsics = \
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index f270c7b0cf34..8529c3940136 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -145,6 +145,7 @@ def main():
>       parser.add_argument('--cfgs', action='append', default=[])
>       parser.add_argument("srctree", type=pathlib.Path)
>       parser.add_argument("objtree", type=pathlib.Path)
> +    parser.add_argument("sysroot", type=pathlib.Path)
>       parser.add_argument("sysroot_src", type=pathlib.Path)
>       parser.add_argument("exttree", type=pathlib.Path, nargs="?")
>       args = parser.parse_args()
> @@ -154,9 +155,12 @@ def main():
>           level=logging.INFO if args.verbose else logging.WARNING
>       )
>   
> +    # Making sure that the sysroot and sysroot_src belong to the same toolchain
> +    assert args.sysroot in args.sysroot_src.parents
> +
>       rust_project = {
>           "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),
> -        "sysroot_src": str(args.sysroot_src),
> +        "sysroot": str(args.sysroot),
>       }
>   
>       json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)

