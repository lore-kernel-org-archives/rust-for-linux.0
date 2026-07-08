Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA0D481DD;
	Wed,  8 Jul 2026 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489528; cv=fail; b=RQLntJCZxJx67rzOKUFl7e6LhSivjImWg6kHFI9hJ6iVIMmd4vvaHUpxe2U80ovwo4aT8N3Q4M/w/p5I7O45mkpeX4ZNVOff3GJHWw9PuO6279mwaH+jjD7iNs6A35g1m34sFoonmiVWcLmGK+PWqkxAJ4FeJ7RUEveVpoiJIDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489528; c=relaxed/simple;
	bh=JlCzV9EfexkrYw3cgQe0Oav2fJErFj4/5+Z5zdkFnco=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=lILpDH2AQbY1RwiSILEnzEhj1+nQybaSTybCaH1s88r99KAiCPin9YWRypgXMuYOXi7SIGfAyccwfU9b41gSOa+Ujy0Wk7LvTjz1/Ny0KhFMNndpN5VcdMYTpBXG9Ao0yOrLZqTIsCHjov0k2ltfgkj89fMuFjUfNjMJH5gBg3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AhN6/4/N; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AhN6/4/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+FHTP2+v2G9fWog4CKxf5SHn16QB/IZFuCGJKzQT3xLbLnUXZzWa2MfdhVxuPFR/Kzh9PC/2WLfXngNhuZeppvZWpykH5eZfuvASQg4ZdzWQiJkNQRg67lYNdgRbGidIKLi7whpellI1qolteKIkN/gr0Dpss+zCI9Wi9kkQXNf9XJ/hQVHH5I3EPgy8tjBGrGH3TqzycODEjnMuivLHanKUo/kCqn/qfgHZC8KUw+3K9OtFE51p153Sj6XyIU/nDY3LWyTIc+srHP+DXqqTjhc/tg0fm/eWuCiDgOAJ0rtRkXiXWB3zb+TIRVvB/i6witBFdjKZuudIZaMj5nmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krDrnEWDtLddd/sweDRaShF52z5RbRlo7zyygCb4MPI=;
 b=iO+p50QCkardUnkfadkFCDE0wSqEL5i8YWj+Cx1GHoOLjy+GlAwj1m4AlWZgxlhicxotmKfBr+2iZPIWOYCM/vOe1MrXDkwIIZiR0kkvHhvpdk0Pf2B4EY3uL84E5jGAkiIknTEApRYZGPLZYUjFP8PiWtbazC5hav/4qq2ZjzgQGxS26AYq0loJNEGzhe84HbTWwyAQybAjQ1Tcy5INEMAszOjW9hueT72rDgyK+vCQsjYGpsZu4AycrGAGYJHmSsEGCVC7f4DyqWOj9MToRbmh+qJYX2elcxlhy3Q/bHaP6kQVGg4Ms3IHZZiX3mQyFVQe1xRGHkTc/UwP+q1gdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krDrnEWDtLddd/sweDRaShF52z5RbRlo7zyygCb4MPI=;
 b=AhN6/4/NebeeLFBrGwt2wzPQ+1Cunk6WKIXAFoAj8NfAugmMqP1BiOerps54C5NVeJHBBvoqiZVQjjGQuqYs8J7zxV95CtIeZ++4PI8OqfszTZb9IOJBT3JJTaG0hM4GovC47oo8jowsSA1ehXyuDPpW7WFEKEGm7oTJsG9hINeKQxbfCeTAm9LN0Aqx2FQpl1o91CGuaaKkZuCbRVpFTT9sXgKrGf7uHUHu6dy4Onsme7joqA4O6q3eOR3OGsGOYg8OftfgbnvNitvFZoA4vkghZJjJXjFtCJ7EcporL0Wr9I79vtINGFfVRGJnYzJ6fBORsl3XxtKn9z4eAmXE+Q==
Received: from AS4P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::16)
 by PAWPR10MB8067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:383::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 05:45:21 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::2c) by AS4P195CA0027.outlook.office365.com
 (2603:10a6:20b:5d6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 05:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 05:45:21 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 07:45:20 +0200
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 07:45:20 +0200
Message-ID: <7bcbb466-0c2e-41c5-9c85-8b4e73348d1b@de.bosch.com>
Date: Wed, 8 Jul 2026 07:45:19 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Harish-CS <harish.cs.ss24@gmail.com>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
CC: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
	<linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
 <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com>
Content-Language: en-GB
In-Reply-To: <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|PAWPR10MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 187a6756-8ecb-44e5-e6b0-08dedcb419b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|23010399003|376014|18002099003|4143699003|11063799006|56012099006|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	SOphulPZqOsX5lFfoffa/h5i6VrC3qv96g/zyuXEUjDa7q1YM3w37KAdPeJ6c1ZhGoG3pyS7BynrKANlWAgLDcyyns/iYMyd9mUrz2/W8js+513ZrJ7OGS8L4qK32/emnPUyrAdGF5MEiN+cj7ts51QVedDkHLbp4s5wXT0E7FMotsW6rQgbSJTUn/6nuQ7198yNgux9pFpAP5mC1GfXCQ6ZeFY7ufV9TmBRXz6fZ3+DzLnP0iCtglBbTVnuz0E05oxKnR1ePVi0hBvqZbAjQc1pzbFnZVg9XNxsuVf/ik4WFwBb2DCfIl8+/sMz57ci+95wu7f2i9BUJPVzH3y9ZaaGVW7C9zw2X4k2jf9KoA9NPF8VHQS8wxBf5d2CT31ESKOLkrdbVGYe6byedXWQrhheAnM857RWpES8VION6PdYZccNnyIMsOmRtq+oe3CstMd9COrpiU0R84x0Iv1mnaosuVf6mnXGkLiCJcvhwyrsv90sAVcWrxm7rORLW+KOk4ztklJVSViG1sVpaT9GEXHrNO3YL8WZGo1t+3Rtp/Jhh+OO+AL487gzTjLJoENkVV1BO8X7b+/CFQ17f2AyEaviDnaEmCFgsq36sjxZo28A6vgG16bSe5exKISh/b5ly9iPzLarTxrvStOUb8Eq8g==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(23010399003)(376014)(18002099003)(4143699003)(11063799006)(56012099006)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	us6YMInRuNQPW6Etmyux3UHZUwVNmxSUHcJmnn7dkIuvd+7kOq5TASYp3cT0l9UWTyJk2x6vN6Fy43R7HDBft8skqSReTLXHMg3yMgPycnj7JYQso00N1XwSBpzjBQoDqZBqKNbhHp9pYiS+q4j5Rx++gO6PJ/i5VLhyo3gfEwsnJO1tOlopgL1e6r+fBfq4deTF2gdKmfHBBk4O+I+84uN+xpOffkh5X0nvyZojOfWbcGpnU+WI6JHW66zQKdYyvYcBLEE8Jawacr1Mhj6vJsji4uJOe+Azy/YYFiSA3Yl2kClTz5SbytmFjcmyvBwCjKdJb/whxDFTLVqWey/JD9R/ifJpHzzTqnpLfJHj9z+2H6RsQyUZ2a8bXTScE3WUJnwUs7crnwbmKIEoZduk/DBwd2uJREsoADPhIYxa5i9e9Our1/XAeUzqedH7+ChQ
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 05:45:21.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 187a6756-8ecb-44e5-e6b0-08dedcb419b3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8067

On 08.07.2026 07:41, Dirk Behme wrote:
> Hi Harish,
> 
> On 07.07.2026 10:21, Harish-CS wrote:
>> Rust panic paths are discouraged in kernel code because panics currently
>> lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
>> uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
>> notice them during patch review.
> 
> We've had something similar some month ago, already. Maybe you like to 
> check that discussion:
> 
> https://lore.kernel.org/rust-for-linux/20260707082104.90951-1- 
> harish.cs.ss24@gmail.com/T/#u

Arg, sorry, wrong link :(

https://lore.kernel.org/rust-for-linux/20260201155718.1623802-1-jason.kei.hall@gmail.com/

Sorry

Dirk

> 
> If I remember correctly the main concern was how to filter out the 
> allowed/required usages. I think the example used that time was
> 
> https://lore.kernel.org/rust-for-linux/20260131154016.270385-3- 
> shivamklr@cock.li/
> 
> Best regards
> 
> Dirk
> 
> 
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1191
>> Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
>> ---
>>   Documentation/dev-tools/checkpatch.rst | 4 ++++
>>   scripts/checkpatch.pl                  | 9 +++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/ 
>> dev-tools/checkpatch.rst
>> index 6139a08c34cd..afa9787c1b9f 100644
>> --- a/Documentation/dev-tools/checkpatch.rst
>> +++ b/Documentation/dev-tools/checkpatch.rst
>> @@ -303,6 +303,10 @@ API usage
>>       See: https://www.kernel.org/doc/html/latest/process/ 
>> deprecated.html#bug-and-bug-on
>> +  **RUST_PANIC_METHODS**
>> +    Rust methods that panic, such as unwrap() and expect(), should be
>> +    avoided.  Handle the error explicitly instead.
>> +
>>     **CONSIDER_KSTRTO**
>>       The simple_strtol(), simple_strtoll(), simple_strtoul(), and
>>       simple_strtoull() functions explicitly ignore overflows, which
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 2b7a42bbdd94..5bdb065370ea 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3972,6 +3972,15 @@ sub process {
>>               }
>>           }
>> +# avoid Rust panicking methods
>> +        if ($realfile =~ /\.rs$/ &&
>> +            $line =~ /^\+.*\.(?:unwrap(?:_err)?| 
>> expect(?:_err)?)\s*\(/) {
>> +            my $msg_level = \&WARN;
>> +            $msg_level = \&CHK if ($file);
>> +            &{$msg_level}("RUST_PANIC_METHODS",
>> +                      "Avoid Rust panicking methods such as unwrap() 
>> and expect(); handle the error instead\n" . $herecurr);
>> +        }
>> +
>>   # check for .L prefix local symbols in .S files
>>           if ($realfile =~ /\.S$/ &&
>>               $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END) 
>> (?:_[A-Z_]+)?\s*\(\s*\.L/) {
> 

