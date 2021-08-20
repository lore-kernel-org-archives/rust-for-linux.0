Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C8DC4338F
	for <rust-for-linux@archiver.kernel.org>; Fri, 20 Aug 2021 22:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 718E56117A
	for <rust-for-linux@archiver.kernel.org>; Fri, 20 Aug 2021 22:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhHTWTU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 20 Aug 2021 18:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhHTWTU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 20 Aug 2021 18:19:20 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0077FC061575
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Aug 2021 15:18:41 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id z1so14138040ioh.7
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Aug 2021 15:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oEV+q7yETs29r4pos6r06LcFnpY5lQRY2ce3C+/wnyM=;
        b=YbnNqAO0J2v/2LCfejmKGPwXgcYPfpF5hyXwYlquPhj5SwVlx6JwfJngJyqdLu+nSB
         QrZVy00ihZmMNjEB2TmFE8x9T80F2g2BDSlxUjUeSVpamZn/rGg1YazqMZGwzRgtvOZ5
         J3Fs6C0fKMy5nVYvUv/qN48cveC23Iu3r5c2KIISIK7PNHLvK0HGKQa/JBbjp/igrtSV
         Zz3YOUwPlrVSUMobb1Ek5o2CaC0f/4rvF3s8Qp3Fp3mYxKiB3aLCjbGf0whU3MrVEJWS
         jEIvaJXfzLrcZ4SsfJed/S8anjCKcUZ2w9VzT97dzN31dG5SZe4bbiJL6jRYXLBHIic3
         SCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEV+q7yETs29r4pos6r06LcFnpY5lQRY2ce3C+/wnyM=;
        b=gErJeoepQHANCnJGSxSkhw6qZOUCD8dYkJL6txCqUf+8il52Lh32SQJ4sJ2sidYwcE
         7qYld4t/IMPEWTU/hanEpJc8LtX7fCi57/0eNxKPHR/2q2L6KU49307Zwi3kp5gwkH7h
         3dbMO7BDav4qaUGBR3EkjIar+0ugSNp6GzDz4i5sAVOoduW1qvputuFbpjG9vlXCSnV6
         0bOdT30lGloBPkmVb5iixogksqLl4rdAmtt8IKuEHtYYoCkakCcJ6KwvqdbzyIwt245r
         ZnZ/wzPmIopQ7SVbs21FCVGXFF6byOjnbwXcP5ntn/iMtggWuiHvQQmNtjg4VOFYZ0LU
         5WQA==
X-Gm-Message-State: AOAM532sQyz7kx+CCY1c2TA+N7aVvNXqKahNe/mKB/udp92OCi2EwQMV
        3IVVmIeRHpav5dM+m3D4CwUOLGhNlFFo4E5+uX/qN4nc4as=
X-Google-Smtp-Source: ABdhPJxAPk/Q9tgVCgUvU8YSI9xRhSMNEtMAqVrHB7lALSWkOPHmTBjnTVcMVnwP8pBMdwpd2/irncSmvM6I9/LMM58=
X-Received: by 2002:a02:c80e:: with SMTP id p14mr20048605jao.8.1629497921358;
 Fri, 20 Aug 2021 15:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <1629163412-157074-1-git-send-email-amartora@codeaurora.org> <1629488333-305361-1-git-send-email-amartora@codeaurora.org>
In-Reply-To: <1629488333-305361-1-git-send-email-amartora@codeaurora.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 21 Aug 2021 00:18:30 +0200
Message-ID: <CANiq72=QzrN=Mo5M377ijeTy0ZV-7r33UCRXB1JyQLx0Z9KdWQ@mail.gmail.com>
Subject: Re: [RFC v2] soc: qcom: socinfo.rs: Add Rust Socinfo Driver implementation
To:     Antonio Martorana <amartora@codeaurora.org>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Antonio,

Thanks again for working on this.

On Fri, Aug 20, 2021 at 9:39 PM Antonio Martorana
<amartora@codeaurora.org> wrote:
>
> V2: Addressed formating issues, added conditional compilation to debug_fs
> variables, fixed Kconfig, and still working on removing references to bindings::
> by abstracting FFI functions through rust/ .

Normally the changelog goes outside the commit message, i.e. after `---`.

> +/// SoC version type with major number in the upper 16 bits and minor
> +/// number in the lower 16 bits.
> +
> +const fn socinfo_major(ver: u32) -> u32 {

Doc comments should "touch" the function they document. But using
`///` like shown here would document only `socinfo_major`, and what
the comment says is not really the function documentation. What I
meant in v1 is that perhaps you can find a better way to document all
of them, or none.

Given `socinfo_version` is not used, I would remove that one, and put
"// The upper 16 bits are the major." and "// The lower 16 bits are
the minor." as normal comments inside the function body. Even better,
you could create a `SocInfoVersion` type.

> +    ///
> +    /// SMEM Image table indices
> +    ///

No empty comment lines before/after, please. In addition, `///` is a
doc comment, not a normal comment. You are trying to give a heading
for a set of `const`s, not document the first one.

We should add a lint for the former, and probably we could also try
one for the latter, too...

> +#[cfg(CONFIG_DEBUG_FS)]
> +const PMIC_MODELS: [&str; 37] = [

This is fine, but since you have created a `config_debug_fs` module,
perhaps you could move everything inside it.

Related: perhaps the name for that module could be something simpler,
like `debugfs`.

> +    unsafe {
> +        let ref_mut_seq_priv = seq_private.as_mut().unwrap();
> +    }

The `// SAFETY: ` comments in several places are missing.

> +fn qcom_show_pmic_model(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {

Several of these functions cannot fail -- so why `Result`?

...ah, I see, you are panicking now -- but then you don't need the
`Result`. If this was userspace and you were not expecting a failure,
then yes, panic might have been a good idea. However, here we are
supposed to return the error like you did in v1. When I mentioned you
should use `Result`, it means you should return the `EINVAL` as such
(using the pre-defined error constants we have in
`rust/kernel/error.rs`, which are in the prelude for ease-of-use, see
e.g. https://rust-for-linux.github.io/docs/kernel/prelude/struct.Error.html).

> +    // SAFETY: `socinfo` is guaranteed to be:
> +    // - A valid (and instalized), non-null pointer
> +    // - Is properly aligned
> +    // - Adheres to aliasing rules

The `// SAFETY: ` comment should explain why the callee's
preconditions hold, not just state them (which does not help much a
future reader searching for UB).

> +    unsafe {
> +        let mut_socinfo = socinfo.as_mut().unwrap();

As mentioned in v1, `unsafe` blocks should be split and reduced as
much as possible.

> +        let test_model = socinfo_minor((*socinfo).pmic_model);
> +        model = test_model;

Why is `test_model` there?

> +    let mut check_valid_model: bool = false;
> +    if !PMIC_MODELS[model as usize].is_empty() {
> +        check_valid_model = true;
> +    }

Try to avoid mutability where possible, e.g.:

    let valid_model = !PMIC_MODELS[model as usize].is_empty();

> +    if model < PMIC_MODELS.len() as u32 && check_valid_model {

Something looks odd -- we are checking whether the model is within
`PMIC_MODELS`, but you already used it to index (which is safe, but
because it will panic if wrong -- which we do not want!).

> +#[cfg(CONFIG_DEBUG_FS)]
> +fn qcom_show_pmic_model_array(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
> +    Ok(())
> +}
> +
> +#[cfg(CONFIG_DEBUG_FS)]
> +fn qcom_show_pmic_die_revision(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
> +    Ok(())
> +}
> +
> +#[cfg(CONFIG_DEBUG_FS)]
> +fn qcom_show_chip_id(seq: &mut bindings::seq_file, p: &mut c_types::c_void) -> Result {
> +    Ok(())
> +}

Even if not commented out, this is still dead code -- it is best to
remove it until you implement them.

> +    fmt: bindings::__le32,

Same thing about `bindings::` from v1 etc. -- if this were not a proof
of concept, it should be properly abstracted.

> +const SOC_ID: [SocId; 105] = [

For lots of data, it is usually better to use `static` to have a
single instance somewhere in memory (vs. e.g. inlining).

> +    SocId {
> +        id: 87,
> +        name: c_str!("MSM8960"),
> +    },

For repetitive things like this (and especially if the automatic
formatting makes it look bad!), a local "macro by example" is usually
a good approach, e.g.:

    soc_ids!(3,
         87 "MSM8960"
        109 "APQ8064"
        122 "MSM8660A etc etc"
    );

or any other syntax you like for the particular case. It looks much
better, and separates the details of the type from the data table.

The macro can be something like:

    macro_rules! soc_ids(
        ($length:literal, $($id:literal $name:literal)*) => {
            static SOC_ID: [SocID; $length] = [
                $(SocID { id: $id, name: $name },)*
            ];
        }
    );

https://godbolt.org/z/dWofxYn19 to play with it.

> +struct SocId {
> +    id: u32,
> +    name: &'static str::CStr,
> +}

Even if Rust allows otherwise, I would still try to put declarations
before they are used.

> +fn socinfo_machine(id: &u32) -> Option<&'static str::CStr> {

It is simpler to pass an integer as-is, rather than a pointer to it.

> +    for idx in SOC_ID {

You probably want `&SOC_ID` here (see the `static` vs. `const`
discussion above).

> +        if idx.id == *id {
> +            return Some(idx.name);
> +        }
> +    }
> +    None

Loops like this are good candidates for a functional style -- something like:

    SOC_ID.iter().find(|x| x.id == id).map(|x| x.name)

Whether this looks better or not, of course, is up for debate ;)

> +        Ok(drv_data)
> +    }
> +    fn remove(device_id: i32, _drv_data: Self::DrvData) -> Result {

Newline between functions, please.

Normally we only prefix by underscore if unused.

Cheers,
Miguel
