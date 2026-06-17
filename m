Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B4C393DE6
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687602; cv=none; b=B1+jOnDNEZMeA+Zm+l3Alb0NyAC/+gP7AqaNI6jjcHjTTkC7CYTUrzpErGTtJZWAE3its09kqlmnsOnAqgcDWRsd2HmCPQeudFajBc5M/c61TM44JZrIJBd163/XII1YmcgxHut6azR0wdn3VfPw+PkWOvbNcTkkUDBqsMPU4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687602; c=relaxed/simple;
	bh=VNb8Oeo8fsnl2dNubUFSWKcRBi3wEZOagsaNZh7wB14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMYSVPdLiK+CjiKMtjR9y9n7y6iAIKUZ5F6LpYN9lTFRpMuk8V1212JI6vtNx0Xjw8PQ3XmHf3gaAnTvRryecC1Gi86XVDLqQApZZuyNepvC8Vp8XcJaZwUlcRqhylLEdmilLyqknyK+63RNf9ax8ID5IoerXLHC6d5akr04YmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXPlLkEF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXPlLkEF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso5839265e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781687597; x=1782292397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdzEnJF2ilqo5mGBwtUC4XQR13hh+SJ7AGP/8bu8ACk=;
        b=CXPlLkEF+mjs8vpLhTWd+Sc6t6QohlDW0zR+1qcMjm4Su3Jd32HU2gmk3tPPTWwaNP
         p9ssRghKH/qE8kop/lDoIOGRnrReIUl1o2il41jH0H49gm4lnXzQzLptSBCUj5j9fKQv
         EU+PWayJVz916sv4cYsraFktqAZx98W+EwtlHyw24vzczbsTM+LAoMcoHaSVW++876zX
         P3iJ/62XtmEQ8fnKOLJvA6DPlQK+v2XT3snuEaU3mmisnQLKl5Q3dwRQBaDaX8slWqWS
         RsyYUdHifQo7y0YeDmzP4nB0vvmJlfur2CQGxUonbu7xpZLhA88JF1/R/TwQYSve1V/l
         ECxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781687597; x=1782292397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdzEnJF2ilqo5mGBwtUC4XQR13hh+SJ7AGP/8bu8ACk=;
        b=OF8BfTsMNrZTtQsHqCuCTxE18XoJqJza6LO2TlHtjAKPmkxcE/yTVGJvsVU0sMZIdU
         Z8CrSEFMIAmL+mL/AGMJVhf6LhVjO2YQ2jPKyb3Nt41Bv5HQPf5gEB8t3w5AgjrSLYL5
         io/q1ViJqCPsZp0FzVOSTJJNryHQIxVLPZ28Ilnexbd5X3BcAydq+woDNO5jhqTKKG/o
         mATQtxaia73SdaK4DkjIs8thFIBYwU2BKRgsgOFNxOa6vCIhS1XmSOLAvD7kwvbU/ig9
         lfcYmAPCcD7g6twXpGWNxD2BLI2pzS0UUVSP/6kRUb8zfhC+3u0Z/VS3fF1ATKNv5gAE
         PBdw==
X-Forwarded-Encrypted: i=1; AFNElJ+NMRF64LbFcI2EbmlaZUYEv29nF9tl1JnMaJZQs1FBi1NKOmjrjoImrTC413TNWOgF5geOkk/+cTfeEUJfmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85IxZvxnCHvxMYAkdBNsIYHvnXZ2McwNZ8ZtFT7AxLVFcHKDI
	KMjtfcnD+m7LjvcIzkrSzrXnP+7s6BCsooUrjUZ09ZsnmTCM4IB2GiUz
X-Gm-Gg: Acq92OE+XneZEpMJ8tguHjkLAEQmjxGw3EKdxJDZ0gUDqCUSNwzioc7apT+PHQEXP2x
	y0XhyF4OmzB07ykpewIZ4/2K+zKeL8Q8RJv8H1DkBa9nco8v0np1jrx+9JNlbkZLfYAyadVoYw3
	QBP1UEIiM8brqiTE82c/jkedM3NH5EjcZ5Qp3pipMhhz5Jm7HbKxhFGDZgVxB9KHv/i4QBZIkD4
	N3Znv3E/wdM0AmuBvinO/2LKJfILBqjKkJ200BSTeptEUVXmZ9w0u3yyWcehWN6TNIFJgvzvE51
	Z6QUWJwQIBKqfmng1toQDaDYvt2b/zlx5+ff8wF3Chj0Hg5/LaVkKmIMgTNB35qpQ2ZSWA0VfJx
	0IiriD1SMw6XtPcQWqNP//zx+UAhyZUfrlwKihV6PZ0c2y/gCAlIuUoe19LH/2XbhFTlkts90CN
	We+H3KmsygEgvndsI6blXAKYia1RZY7Wl+FT+59lNCPOwUNfoE5sjW
X-Received: by 2002:a05:600c:5290:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-492340c604emr29094785e9.7.1781687596953;
        Wed, 17 Jun 2026 02:13:16 -0700 (PDT)
Received: from [172.16.16.38] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm130471915e9.0.2026.06.17.02.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:13:16 -0700 (PDT)
Message-ID: <75552e2d-0bc8-40a0-b783-fba64482aea9@gmail.com>
Date: Wed, 17 Jun 2026 11:13:14 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: add procedural macro for declaring configfs
 attributes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao
 <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-modules@vger.kernel.org
References: <20260612-configfs-syn-v3-1-3292fbc5cc32@gmail.com>
 <CANiq72=RX5V6W+1tj0GHxZusrk5OqYbZ5-xV=wvSssrx_CWXAA@mail.gmail.com>
Content-Language: en-US, en-AU
From: Malte Wechter <maltewechter@gmail.com>
In-Reply-To: <CANiq72=RX5V6W+1tj0GHxZusrk5OqYbZ5-xV=wvSssrx_CWXAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/13/26 12:41 PM, Miguel Ojeda wrote:
> Hi Malte,
>
> Some quick notes...
>
> On Fri, Jun 12, 2026 at 3:29 PM Malte Wechter <maltewechter@gmail.com> wrote:
>> +/// ```ignore
> Empty /// before examples.
>
>> +///     // This will extract "foo: <field>" into a variable named "foo".
> ` instead of "
>
> i.e. please use Markdown
>
>> +///```
> Missing space indentation
>
>> +/// Expands the following output:
>> +///    let item_type = {
> Missing example block, both at the beginning and the end.
>
> Please double-check by generating the docs and looking at how they
> appear in the browser.
>
> The prefix of the title should likely be `rust: configfs:`.
>
> Thanks!
>
> Cheers,
> Miguel
As of now doc strings are not generated for private items in the macros 
crate. I am moving the `parse_ordered_fields!` macro into 
macros/helpers.rs but this means the doc strings are not generated for 
the macro anymore. The `parse_ordered_fields!` macro is a larger helper 
function, and the doc strings are relevant and helpful for macro 
developers that wants to use it.

You can enable documenting private items:

diff --git a/rust/Makefile b/rust/Makefile
index b361bfedfdf0..b4239443307e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -147,6 +147,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
      OBJTREE=$(abspath $(objtree)) \
      $(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if 
$(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
          $(rustc_target_flags) -L$(objtree)/$(obj) \
+        --document-private-items \
          -Zunstable-options --generate-link-to-definition \
          --output $(rustdoc_output) \
          --crate-name $(subst rustdoc-,,$@) \

But this enables _all_ private items to get rendered, which is not 
ideal. How should i proceed?
Best regards,

Malte


