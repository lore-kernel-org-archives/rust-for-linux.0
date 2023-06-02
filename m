Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355BBC77B7A
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jun 2023 14:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbjFBOob (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Jun 2023 10:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbjFBOoa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Jun 2023 10:44:30 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616FAE48
        for <rust-for-linux@vger.kernel.org>; Fri,  2 Jun 2023 07:44:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96f7bf29550so310412466b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jun 2023 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1685717066; x=1688309066;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ9vneQJ4b683G/HZn1+z6+HzvNcmHcX4U7xxt8CZQM=;
        b=yw8e+zIr16AuMoV6eYfdQjAc1RLuoYXai0oH2Q1r+/dxRvIq4Qrd1wrLBkxDSk97Ef
         P5e8dzBAYbbqCjaR5HVf4KxjrpeqQ8inLNp6dWZrBx+Rk6JKWZWMISM4P3YTUkiszM/e
         eZVHzajN+5/a5SXS6FeVY96/iTQ75Bm1MH4rucFpNqZfrz/pqFEaLYTGBu9etkLl7Y9L
         SMpTblwnbC5Q8sr1AJh572wH1Om1uImoIM0E+ndW8+nCpSbOdKUMymkphz3dkCcTbL5u
         9js/yLn7Bv24j7E88qzS4sOYIJDNHRbjbckxu3/s5UOxoWISZhO+A/1NjXMezdyLzU4p
         Vf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685717066; x=1688309066;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ9vneQJ4b683G/HZn1+z6+HzvNcmHcX4U7xxt8CZQM=;
        b=AB1BnC2kKvVyqNAzfErslqskbrqtmIhB5KulthsUE/nkH/ngwaUPDYliwNBPF7Mwyx
         TwimeIjyT0r9AQXYJgRH7W9bO7zuCqE7f8z5F6tE19aQkzRkgD3mOYne5X7mkeuf80mV
         QCsTqsDH3ydDJ216JMFVmKYP/oZomMTRjhpUYAvEZMpaFLnf1gTTk+N2lXAhtVGqPGhg
         PapNQs/8O1c6+Mpwv+7PMRFDyR7EIWR/8FjTuVg2pw6NKlRC8EbQUbieHtXVXo6r89Ds
         /JZZu/dn8FisJ1nkNMeD2Iuj4j8cf4UHZZPZth4dxA2dGgeySyQRDuJfgtnI1HzZ0bwf
         4dgA==
X-Gm-Message-State: AC+VfDzlag5nr6Gr2ASeqnuIk+qPE70CZyO6qUT0R9BhX07UGnui7MX7
        nHOqQ/L46VGYVwUGyikoiVSizQ==
X-Google-Smtp-Source: ACHHUZ4NIxiaWN1INAamn2d8kLNiSiG0Yo1f/e8BzpMladerSIQlr063/zx6zbqjaEloURoeYydsyA==
X-Received: by 2002:a17:907:74d:b0:974:c1c:820b with SMTP id xc13-20020a170907074d00b009740c1c820bmr9332316ejb.51.1685717066661;
        Fri, 02 Jun 2023 07:44:26 -0700 (PDT)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709066d4100b00974564fa7easm842690ejt.5.2023.06.02.07.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 07:44:26 -0700 (PDT)
References: <20230601134946.3887870-1-aliceryhl@google.com>
 <20230601134946.3887870-9-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 8/8] rust: workqueue: add examples
Date:   Fri, 02 Jun 2023 16:44:15 +0200
In-reply-to: <20230601134946.3887870-9-aliceryhl@google.com>
Message-ID: <877csl2aba.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> This adds two examples of how to use the workqueue. The first example
> shows how to use it when you only have one `work_struct` field, and the
> second example shows how to use it when you have multiple `work_struct`
> fields.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg (Samsung) <nmi@metaspace.dk>

> ---
>  rust/kernel/workqueue.rs | 104 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index c302e8b8624b..cefcf43ff40e 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -26,6 +26,110 @@
>  //!  * The `WorkItemPointer` trait is implemented for the pointer type that points at a something
>  //!    that implements `WorkItem`.
>  //!
> +//! ## Example
> +//!
> +//! This example defines a struct that holds an integer and can be scheduled on the workqueue. When
> +//! the struct is executed, it will print the integer. Since there is only one `work_struct` field,
> +//! we do not need to specify ids for the fields.
> +//!
> +//! ```
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//! use kernel::workqueue::{self, Work, WorkItem};
> +//!
> +//! #[pin_data]
> +//! struct MyStruct {
> +//!     value: i32,
> +//!     #[pin]
> +//!     work: Work<MyStruct>,
> +//! }
> +//!
> +//! impl_has_work! {
> +//!     impl HasWork<Self> for MyStruct { self.work }
> +//! }
> +//!
> +//! impl MyStruct {
> +//!     fn new(value: i32) -> Result<Arc<Self>> {
> +//!         Arc::pin_init(pin_init!(MyStruct {
> +//!             value,
> +//!             work <- Work::new(),
> +//!         }))
> +//!     }
> +//! }
> +//!
> +//! impl WorkItem for MyStruct {
> +//!     type Pointer = Arc<MyStruct>;
> +//!
> +//!     fn run(this: Arc<MyStruct>) {
> +//!         pr_info!("The value is: {}", this.value);
> +//!     }
> +//! }
> +//!
> +//! /// This method will enqueue the struct for execution on the system workqueue, where its value
> +//! /// will be printed.
> +//! fn print_later(val: Arc<MyStruct>) {
> +//!     let _ = workqueue::system().enqueue(val);
> +//! }
> +//! ```
> +//!
> +//! The following example shows how multiple `work_struct` fields can be used:
> +//!
> +//! ```
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//! use kernel::workqueue::{self, Work, WorkItem};
> +//!
> +//! #[pin_data]
> +//! struct MyStruct {
> +//!     value_1: i32,
> +//!     value_2: i32,
> +//!     #[pin]
> +//!     work_1: Work<MyStruct, 1>,
> +//!     #[pin]
> +//!     work_2: Work<MyStruct, 2>,
> +//! }
> +//!
> +//! impl_has_work! {
> +//!     impl HasWork<Self, 1> for MyStruct { self.work_1 }
> +//!     impl HasWork<Self, 2> for MyStruct { self.work_2 }
> +//! }
> +//!
> +//! impl MyStruct {
> +//!     fn new(value_1: i32, value_2: i32) -> Result<Arc<Self>> {
> +//!         Arc::pin_init(pin_init!(MyStruct {
> +//!             value_1,
> +//!             value_2,
> +//!             work_1 <- Work::new(),
> +//!             work_2 <- Work::new(),
> +//!         }))
> +//!     }
> +//! }
> +//!
> +//! impl WorkItem<1> for MyStruct {
> +//!     type Pointer = Arc<MyStruct>;
> +//!
> +//!     fn run(this: Arc<MyStruct>) {
> +//!         pr_info!("The value is: {}", this.value_1);
> +//!     }
> +//! }
> +//!
> +//! impl WorkItem<2> for MyStruct {
> +//!     type Pointer = Arc<MyStruct>;
> +//!
> +//!     fn run(this: Arc<MyStruct>) {
> +//!         pr_info!("The second value is: {}", this.value_2);
> +//!     }
> +//! }
> +//!
> +//! fn print_1_later(val: Arc<MyStruct>) {
> +//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 1>(val);
> +//! }
> +//!
> +//! fn print_2_later(val: Arc<MyStruct>) {
> +//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
> +//! }
> +//! ```
> +//!
>  //! C header: [`include/linux/workqueue.h`](../../../../include/linux/workqueue.h)
>  
>  use crate::{bindings, prelude::*, sync::Arc, types::Opaque};

