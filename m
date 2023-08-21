Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3E4A3B
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 11:30:43 +0000 (UTC)
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A72100
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 04:30:36 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-993d41cbc31so221211866b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Aug 2023 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692617435; x=1693222235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HA8dqby1nZ1fwOUv1l3IML+MlLZiMB2vRjvmhbRkLTM=;
        b=xFql09yay+vpn1dg3gZEY3KE44Qe4Q/3kWxh7GyZ/ReG01cKaillbXT0sDqGyG0kXC
         eyj8ynoiBP9qwGdEitsJ+fVFgEfscB9Z05kNn2bShiy+CpGo2cjGJ4lZ2sKVLFbUrn5O
         YnQuYOxIPiAKxKM0kVvRJIXoWli7+a5uVDTOJI9uTIlFtXa1fsanqMsd/pKjFHICV9zo
         Im6uhpT9jdqjId+YclvpI/Mae1olkLxA/Ec+3g8Kax5tnNvllRdPAU+tHIUihQ3Em2df
         Q2q8kFimywGW3EJFpRuM9SSlfmXEZtIgQmQkVypXhoasIbjtRUE9u5WlkayIcKwOou4u
         R4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692617435; x=1693222235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HA8dqby1nZ1fwOUv1l3IML+MlLZiMB2vRjvmhbRkLTM=;
        b=kxAeYYGFF4/vKmjLU8J28SyFhsaKtgInf9ykKcXKm4FwbAfmdgZNtD28hfI5N+ngeW
         CP06bZIh98XRGoHd+O1h3dn6VukyxKo8P7dFTABOkExapzUXQXmaZyFG+MGTXl9u8XlN
         T0Gp8fnwTBS1bj7TjA2jpkxD2zc1OXcCIfJgq1cswZxgL/0KaS63BpslXMaKGHjROw6N
         jibudtFP9ow/Uotua7fg/o+68P5zO6VFspss/D9c7BkP4wsVTM7nzW7nWGi2DYNXXnvU
         krhKPMlNCyLUiNCi3hdIOgl/+h/5wqQySYDzBmxKeCdBx7JXr0Zppka+n04Xhrqtj2U+
         Nalg==
X-Gm-Message-State: AOJu0YxNKql9KDWfKimSj0UTXCsvK+yCFnFBcQOUlSUt7tTVGPt/RFTk
	VZbFngNzYIpqOsPlxyMbbhIx6UztsySCMcA=
X-Google-Smtp-Source: AGHT+IE1swuyoYJXn3wCV2WuJ+6CizH2g2W/p4ht1wxk7+OSszBp/ZO7oL5XOH70/Fs+Eala1K+zuoPWBDu5YRs=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:cb2a:b0:991:c35f:ad54 with SMTP
 id um42-20020a170907cb2a00b00991c35fad54mr20902ejc.7.1692617435468; Mon, 21
 Aug 2023 04:30:35 -0700 (PDT)
Date: Mon, 21 Aug 2023 11:30:31 +0000
In-Reply-To: <20230814084602.25699-14-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230814084602.25699-14-benno.lossin@proton.me>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230821113031.1498685-1-aliceryhl@google.com>
Subject: [PATCH v4 13/13] rust: init: update expanded macro explanation
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	nmi@metaspace.dk, ojeda@kernel.org, patches@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, yakoyoku@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> The previous patches changed the internals of the macros resulting in
> the example expanded code being outdated. This patch updates the example
> and only changes documentation.
> 
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
