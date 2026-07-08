Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3993BE165;
	Wed,  8 Jul 2026 05:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489286; cv=fail; b=BM1tHO54BNwmsxP5dEJVvpDarP+BNfENz0Hvm7/eiMX08v0SBGGH2CQUjXRJIzl74Ui7gkGJbzLSDuzPpYGsbH6DIrMLfGTEa86j9QsUeJUqzKo9eLbQCXevj7DvVaKBhzyJziKzNv6TPbTs38CZgU3Nflt0epPiTt+xrpNpT6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489286; c=relaxed/simple;
	bh=fuqH/lNg+m3e1pe3uA0KshF6NhOJtq/FvhviexRRxGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QAEB+IKqUtLAkO+KDLdi9/l75cgE0cDT4Q1jFIi1N5oxpkgtHjlUQfSdfgaWMUkCHZvsAX682Fp1C1oCnQNsjYHdd0TAeVzbCbHfoy2GHI+NBbFPA6csvS2ikwX2N6NbLtgJTnQcAkMFsp5g95dZnILy03VtcPgujf6SIksiLxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=dye0l9Hf; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="dye0l9Hf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc2gIbbZ/Fj7k36ERVV+cSHABjyTKytItIKVMFGWftcqBhDHvs3bZSS8aS5HqoiQVq/ruc10qvGNy5tRjB09MApTdTADjqMHc4nUhPpG0nwTk1Ubt2lD03KiuB56No1EO1Q/Zows9v7UTCFOmcJM1pLLAjwwCkRazJaQviSmmOn+My+ipwG8VVSHValUb7zkLJh09skTFM9Mx/++YmXunxr8DVx+NvEz+kGSz0RJgVgiwKyITAQiwhmXu6oh2NpBXjuB22wFVYLjIFyNMdkRrhEU11UfZnF6TOrCzPWfQ8JHU7Gr1xVqqm8WGMAaivUzs6ez3oeB2GEH7zJ2mfa3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fvpy0Jt6C2D1hT7WAjx0zIXQ/yZlL0AP1EWQpkFa54=;
 b=ShxgAXKAlA0jip2RVRXlhTWuD4LI7ulREJ73svxF5sKLI9y1pK4ZuKmhZDURJxguCvdY/lp7q7wil4/2n7vfIuHMQQCY9G6/x/IpOfCX1+ywy/jqoT14Exg8lVZKYGkfmeBhK/mcnOeh5YeMezQdAPo6VLh6yslkVYnMaDn/a6JLzO7mT6m/XSycegyl+OxAMHt9JDJDYpaagAakFE40hB+VlPaqPcaKpjTTlOIG+YFXYv3igTn4oXKxCkMfKsETxNBi0NbZj9wyxLBZA+MXDY1hFkq5VzEaANHrKGogPV+z2xq5zCFCcQRzu1xnHA3e1v+JzuYo2s1Hd8FYG0TKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fvpy0Jt6C2D1hT7WAjx0zIXQ/yZlL0AP1EWQpkFa54=;
 b=dye0l9Hfq4FwkM6+yiQn/bFjduAj6LIc/Wfm8ZoSVRySG9IjTynfoRZr+YVyhm4f+w50IgiS3qSsJOYcAkTapQxBMC3yzxn8HtxP+UChPXc8N7RwkfjPDGM/aSBqJlOQdh3lQnoTsWFWLJv6ywdSP8kAHFTgPrBGhPZjaWL3ZAy9itShdyveOFHgboIfeQcF8PodF9HREOGQpWrx4920JXxwnI155ItoN8NPn5B7s+XDbyisn+kK1mnQt6VecDpQBOCychWztmKRnLX/MYcUNNGs+3j6wA/SPPQanva11ALQCCvGfJHX7Qd6OxxD6X4Gb/Mum8YHPM2irFaJCxTuew==
Received: from AM9P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::6)
 by VI0PR10MB9333.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 05:41:18 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::16) by AM9P193CA0001.outlook.office365.com
 (2603:10a6:20b:21e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 05:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 05:41:18 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 07:41:10 +0200
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 07:41:09 +0200
Message-ID: <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com>
Date: Wed, 8 Jul 2026 07:41:05 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
To: Harish-CS <harish.cs.ss24@gmail.com>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
CC: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
	<linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|VI0PR10MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: c409d6bb-bef2-4f7e-e645-08dedcb388f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|7416014|376014|18002099003|22082099003|56012099006|11063799006|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+kllsDoHvP819K6MY9sK/Kp9FvBVbxlDpvQR1XdAe8wksLEC7fwWF51gui32RBTrUk1n9k24ktJTUSjTkvZoVO/nNnkK5lnLol+Tl9HKM92Yezu5d1jc36xVgDrvj6iWIQwZa/738MY717jN6ETkznPFjg+pWY0iM9ccDdu3E5ySJ0ydySHLPvWasX78osib/IL8xhHEntOiMUn4gTpGdfwVxs1wmZQKrbpm7VOWj8qoTazdowaFjLQ53hOXrEtHmuWEDpRSOYW1WhpJYg+7yC0pNGGnm/2jMYakXWi3bEZnJQ8PWlIrZZ7GVZDbkifi1HqDJLXviIZZCINOpKcUgpY+rGPHxTawWB4XTvHf6Xp30IOZbvYvA2t4hAZU9c2ho8e5oM+3bhQMAsPxaBbxYV7tO6ahN+p1AW3mSDIzbotGeotDDOKNFNj2NOxR9yo1so4/kq8oek/xaCUUTuH+gpDFVZD++r3vdSLZaViLfHsGZ5IiRWoWcHiy9ZJ/RUEGJhejRKeI7PKKmMQ9Ga38fyEnBJHE08tMj3LqSkD59BLuE9KmN8Sr86hOe+Kf2D/ioXeZLCdzXDFnx55uLeHgv6w2ZI5utg/BpqRIvY2MK0hTidpLrpzjr7Ii6zJaSa2pBTLspy12tAvxL4E+9kRjIg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lr9osmsNFdxX1KdkTzIQG50k3xEUv2K+mjQUa68uuHuM51WYWTukI/uw90vTTouY64aE3Qw8buFTcV4/nXJI6y82WZ9bu7+oynLoC6V+zuXaNCGwvj18l4fKvOSJClYOQ0R7Y5nEkFY8h6iLxO7kkkBkEsi/GF3emc2YV93qOmzII4hmYhiRLOL2wzhp8Ao0CMempewcdDnbjDkqfnwdPNSJHnXSx0L5VbbouyiOWlZz8W7jWBTC5K513DK9jSZMxdvUmM1VgRFgCtREiPaJf6prEgOO8Ea2ae6k79xLNjKaiY3kVlnrcCzXaoRHxQ5t3ET/A3hvOPHwr2T9wjip7ZSERk21c9MK3PHdozL16T3SfMq170WMJPQ7UbuxwXa6Qro+EhDBSlvUoi1X4xeV5eL/IFrpopOqKFhXvYw9U6KuV2uWy02bHIjHNpjdcaUx
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 05:41:18.7677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c409d6bb-bef2-4f7e-e645-08dedcb388f8
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9333

Hi Harish,

On 07.07.2026 10:21, Harish-CS wrote:
> Rust panic paths are discouraged in kernel code because panics currently
> lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
> uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
> notice them during patch review.

We've had something similar some month ago, already. Maybe you like to 
check that discussion:

https://lore.kernel.org/rust-for-linux/20260707082104.90951-1-harish.cs.ss24@gmail.com/T/#u

If I remember correctly the main concern was how to filter out the 
allowed/required usages. I think the example used that time was

https://lore.kernel.org/rust-for-linux/20260131154016.270385-3-shivamklr@cock.li/

Best regards

Dirk


> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1191
> Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
> ---
>   Documentation/dev-tools/checkpatch.rst | 4 ++++
>   scripts/checkpatch.pl                  | 9 +++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 6139a08c34cd..afa9787c1b9f 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -303,6 +303,10 @@ API usage
>   
>       See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
>   
> +  **RUST_PANIC_METHODS**
> +    Rust methods that panic, such as unwrap() and expect(), should be
> +    avoided.  Handle the error explicitly instead.
> +
>     **CONSIDER_KSTRTO**
>       The simple_strtol(), simple_strtoll(), simple_strtoul(), and
>       simple_strtoull() functions explicitly ignore overflows, which
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2b7a42bbdd94..5bdb065370ea 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3972,6 +3972,15 @@ sub process {
>   			}
>   		}
>   
> +# avoid Rust panicking methods
> +		if ($realfile =~ /\.rs$/ &&
> +		    $line =~ /^\+.*\.(?:unwrap(?:_err)?|expect(?:_err)?)\s*\(/) {
> +			my $msg_level = \&WARN;
> +			$msg_level = \&CHK if ($file);
> +			&{$msg_level}("RUST_PANIC_METHODS",
> +				      "Avoid Rust panicking methods such as unwrap() and expect(); handle the error instead\n" . $herecurr);
> +		}
> +
>   # check for .L prefix local symbols in .S files
>   		if ($realfile =~ /\.S$/ &&
>   		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {

