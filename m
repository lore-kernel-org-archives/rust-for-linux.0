Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD2717740
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Nov 2023 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R394e4f4"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA2EA6
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Nov 2023 06:34:03 -0700 (PDT)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2c515541a25so10792201fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Nov 2023 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698932041; x=1699536841; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqKGEH39PPHnNiVVPBYzmnT4CUHHmCMU/QKY1ys0JII=;
        b=R394e4f4qq7ztI0MViJyMwbEY7UcS/wCR+LSNT9eudN1QTgPaMXQPIyYx+GeItKS8/
         b5VspsLi7Hs22sGggSdIc15wRuBmpceEzAHp9DuxXmcoPzReV6q1c6qCuqJ1vzMk8uRC
         I49gaz6yEX+8wOURPLNxB0Sg0l6F9BGkOb2amocklcXADY+FB8IpGiPMCr+/v9mrW/cJ
         PeNPY6i2LP0aBov00RHveQ6Jt/I4iAB39Shb9Df8t16LugilBNhlBWw2nzf/5lwFwMRe
         s29ncItOcblDgvPrI2i2p89HVcUZyFtAgV/2k5DOsbbBtE8mkgHUtPjZdwEc8oL0bZz8
         Ywsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698932041; x=1699536841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqKGEH39PPHnNiVVPBYzmnT4CUHHmCMU/QKY1ys0JII=;
        b=P82vV2Xwh7A0aGFG3kYZtvM7hRayCcB5fpxH0Ay0zwQUrzGCp6V4kAOPY4Y9S2npZw
         GGVxE9LfcasS8DfcJqDeI89AC79RuDRuuwM4w69K1DVi26naxyHFBMA3ffinINKlwIyQ
         Yc8KZavc1fGEj1FyosBprfmHmXWnrwcL80N3qaJ+hGODriHJ9YU6S1vnIQajAKDSU6oE
         ZXu5ZkRTsMTJVopvJa+KUOX5nURXi450LvpuPDCh+XktWG0se49vVx127dUeh+dFkpm/
         FCVNxcaEqV+EWPdB9VAA8fy0P5c03UOsG1VgbvmvKpr8ojppYZXKWgMDBfL8tZyzTITU
         LOVQ==
X-Gm-Message-State: AOJu0YwwbdaQSYqkti6/CcYkdtGSmb7JB07mjIgYeEilNQm0hL/rtyY4
	w1v5TF+1CvgxBEYm2bK8tude1QbIZDg0my0=
X-Google-Smtp-Source: AGHT+IHHcuJIbdIA/IEROtwhycH9Ns+UZKGzaakNQHc0nnR+AjCcTXXBYzk5dHbVlhFkDftcJwfdNZadK69Q11s=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:3216:0:b0:2c5:d52:a08d with SMTP id
 y22-20020a2e3216000000b002c50d52a08dmr214374ljy.1.1698932041545; Thu, 02 Nov
 2023 06:34:01 -0700 (PDT)
Date: Thu,  2 Nov 2023 13:33:58 +0000
In-Reply-To: <ZUKaSD4sPtHzlqfT@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZUKaSD4sPtHzlqfT@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231102133358.324909-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 00/20] Setting up Binder for the future
From: Alice Ryhl <aliceryhl@google.com>
To: cmllamas@google.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, gary@garyguo.net, 
	gregkh@linuxfoundation.org, jeffv@google.com, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, mattgilbride@google.com, 
	mmaurer@google.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Carlos Llamas <cmllamas@google.com> writes:
> On Wed, Nov 01, 2023 at 06:01:30PM +0000, Alice Ryhl wrote:
>> Although this rewrite completely rethinks how the code is structured and
>> how assumptions are enforced, we do not fundamentally change *how* the
>> driver does the things it does. A lot of careful thought has gone into
>> the existing design. The rewrite is aimed rather at improving code
>> health, structure, readability, robustness, security, maintainability
>> and extensibility. We also include more inline documentation, and
> 
> Can you expand a bit more on what the plan is here? Is it a two step
> process? e.g. replacing first and then revisiting the *how* binder does
> things later?

Yes, a big part of the motivation behind this rewrite is to make it
easier to continue evolving Binder.

For example, we would like to make Binder have more thorough epoll
support and the ability for a single-threaded server to handle many
incoming transactions at the same time, similar to how you can use many
non-blocking tcp sockets on a single thread today. This would have a
number of performance benefits, like fewer threads, less contact
switching, etc.

We would prefer to not attempt this in the C driver because of how
challenging it is to make significant changes.

Alice

