Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965C13ADF
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E/cNEK98"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB7DEB
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Oct 2023 02:39:50 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a21e8ee1b7so24915237b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Oct 2023 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696585189; x=1697189989; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=E/cNEK988vE/2UzGrIVHfvV+XvzcGegtB9eTufoZSSCRUEjM1/UEVPaqobQcusXK1W
         mgm7lwdJf+edbOwN4L/1Mit6IvPx8XbSMXns7vk05YRGr+70d4KGM/CRju87hr6Z9M6Z
         lqB9ZKUMSE0foulUmWdhiw9bPi3Pznmn1m6+J93DLZjlczqkULdN/01p4MHulvgJqPdd
         WW6YA3T2pdSIk8kQEsUKyOxEKaXq7/A4/dMCUesO+YHLr4hAgT05MuwlQOqXCnCL9b40
         xoLQDep5BsziMh/u1r+PdHF4U/+T/kGEehQcfWovwajBAgxKZdm5exy7rHcuY09bKIRn
         9zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585189; x=1697189989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=hRMc4XfE8aao0G11XEVtOflTYd17ch3YKSkcTAlF9o+XNRE5rMEZGZ/Debt+MhTlUt
         37BRZJE5hYXxS3gSHHtssAjVyXIKD8oIwfnAXy6gqYUZLEbGj8Dim80sTvBB2wAewv2F
         TnuR3NHJ6ql579on/4KJOs3GDsDE2YpJUgVrHc32UjsD6FHWq1QVjYyAs3yH/AkIEwvP
         gzJsUHe6Pz0CpUZEwPxRXAdcY4S9jK7DZtGaYPvwBMObrmL2lX2CpZfi9d0HoHEMerpq
         HQjyTwfLsp043Hw+BPJkItSHG1OeFlGnBkOY1PcBXE7c09PQ3DbrdpSkufQtudiTAy0N
         8ToQ==
X-Gm-Message-State: AOJu0Yxn5leArTK9bn5ToVFg2N1Lc4/x/7WNP7x6ZqfHkpqQRN6ryOal
	G1o6fEpzDhtfz9GV3TeECqcBkFqnz22kq40=
X-Google-Smtp-Source: AGHT+IFQZBWfdCaXSSBlDUFgpHkcIgBKA74bFHPu54DP8HGTzVNML46hu40WvzPmiCHJHHBqFZplWFGw1pok0Uo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:1682:0:b0:ca3:3341:6315 with SMTP id
 124-20020a251682000000b00ca333416315mr107661ybw.0.1696585189364; Fri, 06 Oct
 2023 02:39:49 -0700 (PDT)
Date: Fri,  6 Oct 2023 09:39:41 +0000
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231006093941.1151819-1-aliceryhl@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
From: Alice Ryhl <aliceryhl@google.com>
To: mmaurer@google.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, trix@redhat.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Matthew Maurer <mmaurer@google.com> writes:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>

