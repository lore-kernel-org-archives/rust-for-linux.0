Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21B911C98
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Jul 2023 08:22:42 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1549DD7
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Jul 2023 01:17:12 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31792ac0fefso1446200f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Jul 2023 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1690791430; x=1691396230;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=tXBhRdUtHPrrcaPCjbweWbD8AMIQH0b5ap+ZgbPohPI=;
        b=ILtKjJzDWLauNQNKqeZ9L8laJBDSpcEnpFzZw2345aQVHXBXjLv8naR51ob/R/fkrx
         LZQ9pLNzYOC9T0sKxztD+JEJkuEY0hpTLMAysqz7B9t110z9zYv8l/noosXBA7hkvgnM
         R3BBSfm03rZ5fIcCvkWZjjghUGA3/PuWfvlSJh49sw+d2lzAKf3M8w0+Jc2Wg/vsadt6
         7e2rX1FYzM2iz6ku2aEiXRartgWUjhcMWfA6ivOUjTyBy+Z92IgtpVVRpUrmqiFHskS3
         KE7PJrUIxLGNtTaNrskjbeAHBV2rubibWPoffK0u0IsEn3Ys7JW/MibRhejTuc6j20VB
         hCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690791430; x=1691396230;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXBhRdUtHPrrcaPCjbweWbD8AMIQH0b5ap+ZgbPohPI=;
        b=AtEBobxkcIyEhFF4t6kv4+GpRsyur4IU/pKyY82CgILhNxAopL+zNwuX8yB1zhp4n4
         OGVmjx5mTxmDzrkx6p/sMf/zLIPQWDGSOd0RLghp8RE6XaUEK/Xh73aAC1rIeKoSB1Rp
         QHyweNSZNTMWgq2T6wBRq8BYCyzAaQWH6JtZJzqsWqNYoGAYfyjlBIRs3g0I4t4Fdf2z
         uyER8HjbRQ5gU0zk9I3/Nu9Z4Qa4muGFka9C+6VMOYxGcSjw+C378S/TEVOs0EZQMLHd
         XaAvTp0i8QYEqoIe37EteiaKUyPwDwmNLPYGcVHgj+6eg4IAtffiz4QrKwrRukQWxtnU
         ayPg==
X-Gm-Message-State: ABy/qLb0nO1fpjmPcOzWYtGO/OktJah8S94gbAWNe6+2FT9i7In2oWmw
	Q2c/3nz96ijp2elaouKrkGaO1w==
X-Google-Smtp-Source: APBJJlGlRoVcspGECVffVhhAtcYYUfteqIvOr8ABivvTLEiMG8/BQmr8aW3Ttv6CWtvng4xkn8QPow==
X-Received: by 2002:a5d:452d:0:b0:314:133a:f04 with SMTP id j13-20020a5d452d000000b00314133a0f04mr4535091wra.49.1690791429647;
        Mon, 31 Jul 2023 01:17:09 -0700 (PDT)
Received: from localhost ([165.225.194.190])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b003143bb5ecd5sm12241583wrt.69.2023.07.31.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:17:09 -0700 (PDT)
References: <20230718054426.1048583-1-ojeda@kernel.org>
User-agent: mu4e 1.10.5; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: add Andreas Hindborg as Rust reviewer
Date: Mon, 31 Jul 2023 10:16:10 +0200
In-reply-to: <20230718054426.1048583-1-ojeda@kernel.org>
Message-ID: <877cqgqyuz.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


Miguel Ojeda <ojeda@kernel.org> writes:

> Andreas has been involved with the Rust for Linux project for more than
> a year now. He has been primarily working on the Rust NVMe driver [1],
> presenting it in several places (such as LPC [2][3] and Kangrejos [4]).
>
> In addition, he recently submitted the Rust null block driver [5] and
> has been reviewing patches in the mailing list for some months.
>
> Thus add him to the `RUST` entry as reviewer.
>
> Link: https://rust-for-linux.com/nvme-driver [1]
> Link: https://lpc.events/event/16/contributions/1180/attachments/1017/1961/deck.pdf [2]
> Link: https://www.youtube.com/watch?v=BwywU1MqW38 [3]
> Link: https://kangrejos.com/A%20Linux%20(PCI)%20NVMe%20Driver%20in%20Rust.pdf [4]
> Link: https://lore.kernel.org/rust-for-linux/20230503090708.2524310-1-nmi@metaspace.dk/ [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Acked-by: Andreas Hindborg <a.hindborg@samsung.com>
