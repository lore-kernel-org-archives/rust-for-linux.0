Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F21B942
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Feb 2024 05:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707283971; cv=fail; b=F8ho1g5E+VqKo5d9iTd6comdNUZ/yEBSeGrIYZsE2c+NNnLLHjDa17WF9k5OBTCfP1G5A4S2QIjRMhpRvg8abrfQMIF4CBpdQXojGwstY8QdsXkcLK2tBBImioCHcE1R61cvI55XZS0Suz4O14FtEFMJkWbXoQFuSzxhvaU7pwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707283971; c=relaxed/simple;
	bh=MX4BX8TCsLpNCBTxWQchGVrfzdNwTYPHjAHSjG75YFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A43cLeRXWGIzRPDK0KLiWJRpGQCHDsO7Yl7RdPAZG+ILFR3Cm4J7aBQvDO3zSpG0G19f5jbRfwIw4C2G+9z9pQB+qTRFh8LIr6qjOR9tZ/nKaC8LnoDWe9UxGgqEnOTXjTa4Xex04GC7QYFLarIJhF1CU87H6XYFXhrJznOxS8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Isota0pI; arc=fail smtp.client-ip=40.107.22.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Isota0pI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9J7TFyih1gHqiYIG04juyQpcY9zJCd4Dva8fjIPCWgjzvzrRlomIHdnZkIPuqDemSZl/VsC0HQo7nnpBjh1r3lSUplTmhQ7keMNI2KY8OQ/otJ0TgRckdnP3bpgoh4SM04WoQAgIPUVLO+d8FffWstz+XYJvaJvNDbwucF7dobR/Unj6PNZGjP0Ve3BbX54PDr0Dkg80pLp242pRaGzagza4vu7jTgQsWlNMXNPDuTL3tXkayjGRTGCae3Wc+3s85SCuZkcBCrUOzAtEAr7SxuDzHtXkPCYkXqjZ+iQ5qzv/HHhCdi97hOiDDCACoVufMkJTfftcyh8wnw6VLvQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W3nfIdopbMAs4FVaisq3RZ3HkwZ5X1ztAvRx3lS3lk=;
 b=jYAFLDfYc/7a4vzkHSLTcpYXq2hn90pSxXiZTStfiX/+DUAUsTJ1rL+WZMzuteAnjL6Hgk5OcUXN3pibd8puix+A0D/cgY59PTlzfKtXb7qSiV2+pU4YFZsdhBx9Tz2sKMsyXOOj5vu5ImYuK6tFFCa9CoAvoWhptyaVTczHHEwyDeG/tktc554Bdid8UdoTIAV94oYV4hfvnFAnRMD8mdydVenwODvMdDCbXHiIkm85rhJC8jKXPxYyhiFbNZneCCq5HfADfh1SPBYR87hcmhDW/DELGlGITHi3mWrKYdJ56IGaTxVLQQe9MWERRe3rHr+yYgOiI7Uh/m+ik1yAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=proton.me smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W3nfIdopbMAs4FVaisq3RZ3HkwZ5X1ztAvRx3lS3lk=;
 b=Isota0pI1tkOnWVFtkyoJkc+dkihX2Pqmr1d1k9rOu0fQzkvCJYzEphGsi67yQKHNbr7p2yzvQ5UHTYee2o1ftxMtGTUWVyAK/WtoLiYk6+4b0+IarucJfZtEb/EYrR2YaaMgmZcdNf/VeycVp8/1GmDlrCQ3moAyolDQIdqXSUd+0h+qBJYL9YaTlPKfuLqt/GVc0R00d0iAXeYNycgZIz/9JjtRJqGPdc2gL/Nb6f+ZpsypczvclO+dkfE3oZzVElvyPSPvZfuPUYsSCW3fwxuX4GATCFG/3uEob5XsSrOF/2DGyx+nVyYG2CSKUh+ZiWHuRRJAUJ/H+1yrEBWtQ==
Received: from AM5PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:206:14::15) by DU0PR10MB5802.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3a6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 05:32:44 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::4c) by AM5PR0301CA0002.outlook.office365.com
 (2603:10a6:206:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38 via Frontend
 Transport; Wed, 7 Feb 2024 05:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 05:32:44 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 7 Feb
 2024 06:32:43 +0100
Received: from [10.34.222.178] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 7 Feb
 2024 06:32:43 +0100
Message-ID: <a3567a18-6b8e-47d9-ae44-418de9dacfd3@de.bosch.com>
Date: Wed, 7 Feb 2024 06:32:31 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: rust: extend abstraction and binding documentation
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda
	<miguel.ojeda.sandonis@gmail.com>
CC: <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>
References: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
 <CANiq72kqdsX34MOCz1qOyb0TCxsHAjn9N9S5OqdxfwwtJSGXUw@mail.gmail.com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72kqdsX34MOCz1qOyb0TCxsHAjn9N9S5OqdxfwwtJSGXUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|DU0PR10MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: edbdc3f3-74ab-4831-eabb-08dc279e35da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BsV6CzkNw2womQXL+N1/LXCz6XJzFwohGrY35h8DAQvTOGFD75OufRJA8HH1QTbzHp8wXWqajR17KUF0jZTzwxHV8Ws+qsoC4eqIDG44+0G6ztHfsmXFcBQZXAlzVKHjbw9Jalhpvb5OIbH1ziwi6WW1tjq6zFb0AhEVgxXQDILRodHafMN9ZxFyY9BB+7f7LcHsNxlQxBx/QXgTmzj0PwMnhb3gW5PewcWvQND9Y+dkw5y5wqwjrYvs4IbaKcR3g+Z1ExbG5lP+eFsKtYhG8DnC3ZsFjf8vz5y4TtsCiGQpnGONaMenh/yQmhQnt9w9YAF1na+mTEutLDwflv/EEqRbjTThVKgCTG7l8ZWwKkonjHsYojbGeR4Ys2LdIaNCaIyVfeohCkCa02N+T+gJrF5gQX+LGz+gkqb2JbGhp+VWAJGIqwFfSKgY2bY8Gv/eF4W/ZaxSRNkj+tI3w+mXEvv8dMAHLey0r79i8Wqq2NblJ2PAroiA9pIpGQV4gtGod1w73xVDikTey3Skp9RP3kw+PvLXY70ujSa7Ipx+SMBFt3T2AKvgabeabxR4nk9UpJNA98o6QUb63DkQxi/DbXfBD+YiBCyNcrZMYeX1Sl+KIvA7kSWev/22CQ5HNlQdueyZYkCQJvViFUrlqI5OB52o12Cz941LtPvk1t72iY1v39qGZ8NkgRI6vXEZ04XSvXdEXENByssUn0TFndg0Ohrso2V6M50VmkQx/k4pr2GVHiVbqVi+cyRUU2SZEZzwi/iLrKPCRdoItyAFD6msig6bbvDJzjquRYPQ9mdLxmwOjEBlLyJE4VldLa58EABy/1N+Bbi0mHdAo0RUOaejEg==
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(47076005)(41300700001)(66899024)(86362001)(8936002)(4326008)(8676002)(336012)(426003)(31696002)(966005)(478600001)(2616005)(6666004)(53546011)(5660300002)(110136005)(26005)(16526019)(16576012)(70206006)(54906003)(316002)(70586007)(2906002)(83380400001)(40460700003)(40480700001)(356005)(36860700001)(81166007)(31686004)(82740400003)(82960400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 05:32:44.0998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edbdc3f3-74ab-4831-eabb-08dc279e35da
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5802

On 06.02.2024 20:35, Miguel Ojeda wrote:
> On Tue, Feb 6, 2024 at 7:54 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
>>
>> CC: Miguel Ojeda <ojeda@kernel.org>
> 
> Nit: it is typically spelled Cc (i.e. camel case).
> 
>> +.. code-block::
>> +
>> +                                                       rust/bindings/
>> +                                                       (rust/helpers.c)
>> +
>> +                                                          include/ -----+ <-+
>> +                                                                        |   |
>> +         drivers/              rust/kernel/              +----------+ <-+   |
>> +           fs/                                           | bindgen  |       |
>> +          .../            +-------------------+          +----------+ --+   |
>> +                          |    Abstractions   |                         |   |
>> +       +---------+        | +------+ +------+ |          +----------+   |   |
>> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
>> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
>> +       +---------+        | |system| |system| |          | bindings | <-----+
>> +            |             | +------+ +------+ |          |  crate   |       |
>> +            |             |   kernel crate    |          +----------+       |
>> +            |             +-------------------+                             |
>> +            |                                                               |
>> +            +------------------# FORBIDDEN #--------------------------------+
> 
> Thanks a lot for the effort of making that slide into ASCII :)
> 
> I could try to see if I can export the diagram into SVG and include it.
> 
>> +The main idea is to encapsulate all ``unsafe()`` handling in the abstractions reviewed
>> +and documented carefully. These are considered to be sound then. With this model
>> +it is assumed that users of the abstractions ("my_foo driver") can't do anything
>> +unsound if
>> +
>> +#. the abstractions are sound
>> +#. they don't use ``unsafe()``
> 
> Like Valentin, I feel the wording needs some improvement here. Part of
> the confusion may be the `unsafe()` there -- it is unclear what it
> means (especially given the parentheses).
> 
> It is true we want to encapsulate C APIs and we forbid calling
> directly `bindings` outside subsystems / exceptional cases; and
> ideally provide safe abstractions as much as possible. However, we are
> not the ones "considering" the abstractions sound (or at least that
> way of putting it may confuse readers). We do our best to have sound
> abstractions, but it is not something we "decide". So if e.g. someone
> passes a raw pointer and just dereferences it in a safe function, that
> is most likely unsound and it should be fixed.
> 
> That is, in turn, what allows callers to avoid breaking things. In
> other words, we don't "assume that users cannot do anything unsound"
> (introduce UB?) -- quite the opposite: what we want (as much as
> possible) is that they cannot introduce UB even if they tried.
> 
> And that applies even if users use `unsafe`, as long as they use it
> correctly, i.e. as long as they don't break the preconditions of what
> they use. It is just that the best case is that they do not even need
> to use `unsafe` calls (this is why we want that APIs are as safe as
> possible, because then we minimize the chances that users get it wrong
> and introduce UB).
> 
>> +Abstractions
>> +~~~~~~~~~~~~
>> +
>> +Abstractions are the glue layer between the bindings and the in-kernel users. E.g.
> 
> Perhaps we should avoid "glue layer", since that sometimes implies
> that it is a "thin" layer / "uninteresting" layer. However, the
> abstractions are the actual interesting bits (and can be quite
> complex, precisely to achieve the relaxation of safety preconditions,
> i.e. making APIs "as safe as possible", that you mention below).
> 
> But it is quite subjective.
> 
>> +The webinar `Rust For Linux: Writing Safe Abstractions & Drivers`
>> +
>> +       https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstractions-and-drivers
>> +
>> +has an introduction to this topic.
> 
> I appreciate this, though some of the things in there are outdated, so
> I am not sure about including this nowadays. Perhaps we should record
> new ones instead :) Or, even better, I could "write" the talk in
> written form here, which can be maintained and be kept up to date.


Yes, that sounds really great! :)


> Relatedly, Benno is working on some extra documentation about how to
> write safety preconditions that we will probably add around here when
> it is ready.

Benno, is it worth to wait for that? I.e. drop this patch and wait for 
your version?


In general, I try to document/extend in Documentation/rust/ what I 
understood in RFL is different to "standard" Rust. This 
abstraction/bindings part is one of it. I have some additional topics 
like no_std usage (I think this not mentioned anywhere, yet?) and maybe 
error handling (in most cases we might not want to "crash" the kernel 
with panic).


Best regards

Dirk
