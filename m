Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BE612E5E
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MhCPuiUT"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475061BDA
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 02:31:08 -0800 (PST)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2c50234741eso56660451fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Nov 2023 02:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699439466; x=1700044266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkbdBisJ/PG8hxDlR5ZTMvNYc0Onf1/wmRPSUcltkmk=;
        b=MhCPuiUTLIZN3/OohpOZYQS2TAfVZkSxpgJO1bwPgAk6jXusf9S8IshTewsSbHnHMr
         o5Qepf2wi8GpcZC57HM5lalPtnWFtNjvPOSqcyFtqEMgE7ghr4oGab/drnS9LTpruDYC
         RTkyONK4f5SwA/l5JW3N4qo0SiTmgdEl3md0MPsENkEhyeH0sFNCHvcgxavdOm2NjORd
         lub4AQHrTtEkaGR42YYpmoHjnLfj3k32ATQF6fH/3Nqhe8ck7N/eyuRx6udawTzcv/Ff
         MG2kYNNOkFtF1vfYr2SGenaQ6BdqdGnKXQ0C6IxA03lGpRFaroO3P0HjUY0qpCoN1lqs
         O2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699439466; x=1700044266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkbdBisJ/PG8hxDlR5ZTMvNYc0Onf1/wmRPSUcltkmk=;
        b=P+WN2tvNyFH6UwHpASnPowvueqpR9lGujWe4W1Pe2rtjbawjfpdgx862P619DaDGpx
         1oeLgFKhFIWCPzdUTL23PDAKvUg30TE0SNaeccsU0rVrQGGykxJAkoEwQfiA1pPLfb6Q
         TlEf2jkjDes4TQwtqoyti/klKIf5126f/3oKYq0Kfcnl8k/tNhs89RZyDr+nsnLUSoqp
         +wGDUVO963Eq7JtaDvLsHv0TYikbXVYcS4gPLLrDeKU8dd16DHskSs3VXCm8S/Hw44e7
         8CDaQ1q8nS1uv5VLP04cGXilYnGYQx0wyX206DfznMD5A22iRN4Z7nUi9tzaopfD7oVD
         T8sw==
X-Gm-Message-State: AOJu0YyQz3bEXgNhyc5WgI7GL9Xjiqy4K9ZiLwUy9K2rqs7CS5sj/21w
	4PxJ90tJKSsbxi5lYFONnr16mCNGaNHJE7E=
X-Google-Smtp-Source: AGHT+IHiOejIJB4j/kMYXEAKBS0CqfRXqP6xxVZUu/o248ye6eosevondyHOb53GUXWo9jGNKcFm8W9c1/Efo7o=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:b011:0:b0:2bc:b74e:b4a1 with SMTP id
 y17-20020a2eb011000000b002bcb74eb4a1mr10314ljk.7.1699439466457; Wed, 08 Nov
 2023 02:31:06 -0800 (PST)
Date: Wed,  8 Nov 2023 10:31:03 +0000
In-Reply-To: <B4D1A3E2-1AD9-434A-90AC-8D33532D4A1B@kloenk.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <B4D1A3E2-1AD9-434A-90AC-8D33532D4A1B@kloenk.de>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108103103.524922-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust binder
From: Alice Ryhl <aliceryhl@google.com>
To: me@kloenk.de
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	gary@garyguo.net, gregkh@linuxfoundation.org, jeffv@google.com, 
	joel@joelfernandes.org, linux-kernel@vger.kernel.org, maco@android.com, 
	mattgilbride@google.com, mmaurer@google.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, surenb@google.com, tkjos@android.com, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Finn Behrens <finn@kloenk.de> writes:
> On 1 Nov 2023, at 19:01, Alice Ryhl wrote:
>> +macro_rules! decl_wrapper {
>> +    ($newname:ident, $wrapped:ty) => {
>> +        #[derive(Copy, Clone, Default)]
>> +        #[repr(transparent)]
>> +        pub(crate) struct $newname($wrapped);
>> +        // SAFETY: This macro is only used with types where this is ok.
> 
> Would it make sense so also annotade this safety requirement on the
> macro itself?
> 
> It is only file private, but could help not overlook it, when using for
> something new in the same file.

Sure, I can move the comment.

Alice

